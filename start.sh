composer install 
php artisan key:generate
php artisan schema:dump
artisan migrate --force
php artisan db:seed
php artisan serve --port=8080
