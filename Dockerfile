
# Stage 1: Build the certificate
FROM ubuntu:20.04 AS cert-builder

# Install OpenSSL
RUN apt-get update && \
    apt-get install -y openssl && \
    mkdir /certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /certs/server.key \
    -out /certs/server.crt \
    -subj "/CN=localhost" && \
    cat /certs/server.crt /certs/server.key > /certs/server.pem

# Stage 2: SQL Server
FROM mcr.microsoft.com/mssql/server:2022-latest

# Copy the generated certificates
COPY --from=cert-builder /certs /var/opt/mssql/certs

# Set environment variables for SQL Server
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=YourPassword123!
ENV MSSQL_PID=Developer

# Expose the SQL Server port
EXPOSE 1433

# Start SQL Server
CMD ["/opt/mssql/bin/sqlservr"]
