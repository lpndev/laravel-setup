## Laravel setup guide for development

#### Stack:

- **Laravel** (backend)
- **Vue** (frontend)
- **MySQL** (database)
- **Docker** (containers)
- **Nix** (packages)
- **PHP** (language)
- **Composer** (dependencies)
- **Node** (runtime)
- **PNPM** (packages)

### Clone an Laravel starter kit

```shell
git clone https://github.com/laravel/vue-starter-kit project-name
cd project-name
```

### Clone this repo inside the Laravel starter kit

```shell
git clone https://github.com/lpndev/laravel-setup.git
mv -f laravel-setup/* laravel-setup/.* .
rm -rf .git laravel-setup
```

#### Copy .env.example to .env

```shell
cp .env.example .env
```

#### Recommended `.env` settings:

```dotenv
APP_NAME="Project Name"

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=project-name
DB_USERNAME=user
DB_PASSWORD=pass
```

### Install required tools:

1. Install Nix:

```shell
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

echo -e "experimental-features = nix-command flakes\ntrusted-users = root $(whoami)" | sudo tee -a /etc/nix/nix.conf
```

2. Install direnv using Nix:

```shell
nix profile add nixpkgs#direnv
nix profile add nixpkgs#nixfmt

# ~/.zshrc: eval "$(direnv hook zsh)"
```

3. Use `flake.nix` to install required packages/dependencies

```shell
direnv allow
```

### Install dependencies

```shell
# Install node dependencies
pnpm install

# Install php dependencies
composer install

# Add php plugin for prettier
pnpm add -D @prettier/plugin-php

# Format all files with prettier
pnpx prettier --write .
```

### Initialize git and commit changes

```shell
git init && git add . && git commit -m "initial commit"
```

### Start development server

```shell
# Start docker containers
docker compose up -d

# Run migrations and generate key
php artisan migrate
php artisan key:generate

# Start development server
composer run dev
```
