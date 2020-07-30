# Wordpress-Docker

This docker container includes:

- MariasDB 10.5
- PHPMyAdmin
- Caddy2
- Dev and Prod Wordpress containers with separated database tables

## Installation

```bash
git clone https://github.com/louga31/Wordpress-Docker.git
cd Wordpress-Docker/

mv .env.dist .env
mv Caddyfile.dist Caddyfile
mv docker-compose.yml.dist docker-compose.yml
mv docker-compose.override.yml.dist docker-compose.override.yml
```

Don't forget to edit these files to reflect your setup:
- .env for db setup
- Caddyfile for domain name
- docker-compose.override.yml for healthcheck domain name

## Usage

```bash
make up # Start all containers
make down # Stop all containers
make prod # Start prod Environment
make dev # Start dev Environment
make phpmyadmin # Start only MariasDB and phpmyadmin
make logs # Show logs (Following)
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)