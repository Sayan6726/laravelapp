FROM php:8.2-fpm
WORKDIR /var/www
#RUN a2enmod rewrite
RUN apt-get update -y && apt-get install -y \
    git \
   # libmariadb-dev \
    curl \
    unzip zip \
  #  zlibig-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev 

RUN apt clean && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install  pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

 


