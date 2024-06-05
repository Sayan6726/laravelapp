FROM php:8.1-apache
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
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install  pdo_mysql mbstring exif pcntl bcmath gd
WORKDIR /app
COPY . /app
RUN composer install
CMD php artisan serve --host=0.0.0.0 --port=8001


 


