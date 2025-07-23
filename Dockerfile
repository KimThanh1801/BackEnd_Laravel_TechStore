# Stage 1: Composer
FROM composer:latest AS composer

# Stage 2: PHP với Laravel
FROM php:8.2-fpm

# Cài các thư viện hệ thống
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

# Copy composer từ stage composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Đặt thư mục làm việc
WORKDIR /var/www

# Copy mã nguồn
COPY . .

# Cài đặt Laravel và cache cấu hình
RUN composer install \
    && php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache
