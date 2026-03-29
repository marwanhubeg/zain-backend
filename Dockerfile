FROM php:8.2-apache

# تثبيت إضافات PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql

# تمكين mod_rewrite
RUN a2enmod rewrite

# تعيين DocumentRoot إلى مجلد public
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# نسخ الملفات
COPY . /var/www/html/

# صلاحيات
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/storage \
    && chmod -R 755 /var/www/html/bootstrap/cache

EXPOSE 80
