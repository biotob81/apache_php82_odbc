# Verwende das offizielle PHP 8.2 Apache-Image als Basis
FROM php:8.2-apache

# Aktualisiere die Paketlisten und installiere das ODBC-Paket und andere Abhängigkeiten
RUN apt-get update && apt-get install -y \
    unixodbc \
    unixodbc-dev \
    libodbc1 \
    libodbc1:i386 \
    && rm -rf /var/lib/apt/lists/*

# Aktiviere das ODBC-Modul für PHP
RUN docker-php-ext-install pdo_odbc

# Aktiviere mod_rewrite für Apache
RUN a2enmod rewrite

# Ändere das Arbeitsverzeichnis zum Standardverzeichnis des Apache-Web-Servers
WORKDIR /var/www/html

# Setze den Port für den Container
EXPOSE 80

# Starte den Apache-Webserver beim Start des Containers
CMD ["apache2-foreground"]
