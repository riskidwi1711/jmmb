# Gunakan base image PHP 7.4 dengan Apache
FROM php:7.4-apache

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        libcurl4-gnutls-dev \
        libmcrypt-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libbz2-dev \
        libxml2-dev \
        libzip-dev \
        unzip \
        curl \
        gettext

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql curl gd zip bz2 gettext

# Install sendmail
RUN apt-get update && \
    apt-get install -y sendmail

# Set working directory
WORKDIR /var/www/html

# Copy existing OJS installation
COPY . /var/www/html

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/html/files

# Expose port
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
