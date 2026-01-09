# Laravel Setup

A streamlined development environment setup for Laravel + Vue projects using Docker and Nix.

## Tech Stack

| Category     | Technology             |
| ------------ | ---------------------- |
| Backend      | Laravel, PHP 8.4       |
| Frontend     | Vue.js                 |
| Database     | MySQL 8.0              |
| Containers   | Docker, Docker Compose |
| Package Mgmt | Nix, Composer, PNPM    |
| Runtime      | Node.js                |

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed and running
- [Nix](https://nixos.org/download.html) package manager (installation instructions below)
- [direnv](https://direnv.net/) for automatic environment loading

## Quick Start

### 1. Clone the Laravel Starter Kit

```shell
git clone https://github.com/laravel/vue-starter-kit project-name
cd project-name
```

### 2. Add This Setup Configuration

```shell
git clone https://github.com/lpndev/laravel-setup.git
mv -f laravel-setup/* laravel-setup/.* .
rm -rf .git laravel-setup
```

### 3. Configure Environment

```shell
cp .env.example .env
```

Update `.env` with your settings:

```dotenv
APP_NAME="Project Name"

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=project-name
DB_USERNAME=user
DB_PASSWORD=pass
```

## Development Environment Setup

### Install Nix Package Manager

```shell
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

Enable flakes and add yourself as a trusted user:

```shell
echo -e "experimental-features = nix-command flakes\ntrusted-users = root $(whoami)" | sudo tee -a /etc/nix/nix.conf
```

> **Note:** Restart your terminal or run `source ~/.zshrc` / `source ~/.bashrc` after installation.

### Install direnv

```shell
nix profile install nixpkgs#direnv
```

Add the hook to your shell configuration:

```shell
# For Zsh (~/.zshrc)
eval "$(direnv hook zsh)"

# For Bash (~/.bashrc)
eval "$(direnv hook bash)"
```

### Activate the Development Environment

```shell
direnv allow
```

This will automatically load PHP, Composer, Node.js, and PNPM from the Nix flake.

## Install Dependencies

```shell
# Install Node.js dependencies
pnpm install

# Install PHP Prettier plugin for code formatting
pnpm add -D @prettier/plugin-php

# Install PHP dependencies
composer install
```

## Initialize Git Repository

```shell
git init && git add . && git commit -m "Initial commit"
```

## Running the Application

### Start Docker Services

```shell
docker compose up -d
```

This starts:

- **MySQL** on port `3306`
- **phpMyAdmin** on port `8081` ([http://localhost:8081](http://localhost:8081))

### Setup Laravel

```shell
# Generate application key
php artisan key:generate

# Run database migrations
php artisan migrate
```

### Start Development Server

```shell
composer run dev
```

## Available Services

| Service    | URL                                          | Description       |
| ---------- | -------------------------------------------- | ----------------- |
| Laravel    | [http://localhost:8000](http://localhost:8000) | Main application  |
| Vite       | [http://localhost:5173](http://localhost:5173) | Frontend dev server |
| phpMyAdmin | [http://localhost:8081](http://localhost:8081) | Database management |

## Common Commands

Use `make help` to see all available commands, or run them directly:

```shell
make install    # Install all dependencies
make up         # Start Docker containers
make down       # Stop Docker containers
make logs       # Show Docker container logs
make dev        # Start the development server
make migrate    # Run database migrations
make fresh      # Fresh migration with seeders
make test       # Run tests
make format     # Format code with Prettier
make clean      # Remove build artifacts
```

Or use the commands directly:

```shell
# Start Docker services
docker compose up -d

# Stop Docker services
docker compose down

# View Docker logs
docker compose logs -f

# Run Laravel migrations
php artisan migrate

# Create a new migration
php artisan make:migration create_example_table

# Run tests
php artisan test

# Format code with Prettier
pnpm exec prettier --write .
```

## Troubleshooting

### Database Connection Issues

1. Ensure Docker containers are running: `docker compose ps`
2. Check if MySQL is healthy: `docker compose logs mysql`
3. Verify `.env` database settings match `compose.yml`

### Nix/direnv Not Working

1. Ensure Nix is installed: `nix --version`
2. Check direnv is hooked: `direnv status`
3. Re-allow the directory: `direnv allow`

### Port Conflicts

If ports are already in use, update the port mappings in `compose.yml` and `.env`:

```yaml
ports:
  - "3307:3306" # Change MySQL port
```

## License

This project is open-sourced software.
