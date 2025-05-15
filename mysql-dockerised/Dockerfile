FROM mysql:8.0

# Set root password (you can change this to a more secure one)
ENV MYSQL_ROOT_PASSWORD=rootpass

# Copy initialization SQL script
COPY init-db.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306
