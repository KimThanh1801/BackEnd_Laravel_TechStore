FROM php:8.2-fpm

# Cài các package cần thiết
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql zip

# Cài Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy source code vào container
WORKDIR /var/www
COPY . .

# Cài thư viện PHP qua composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Mở cổng 10000 cho Render
EXPOSE 10000

# Lệnh chạy Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=10000"]
