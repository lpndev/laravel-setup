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

#### Recommended `.env` for mysql

```shell
# Copy .env.example to .env
cp .env.example .env
```

```dotenv
APP_NAME="Project Name"

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=project-name
DB_USERNAME=user
DB_PASSWORD=pass
```

If using [Supabase](https://supabase.com/docs/guides/getting-started/quickstarts/laravel):

```dotenv
DB_CONNECTION=pgsql
DB_URL=postgres://postgres.xxxx:password@xxxx.pooler.supabase.com:5432/postgres
```

- Remove the `compose.yml` in this case.

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
npm install && npm update
npm install --save-dev @prettier/plugin-php

composer install && composer update
```

### Initialize git and commit changes

```shell
git init && git add . && git commit -m "initial commit"
```

### Start development server

```shell
docker compose up -d

composer run dev

# Essential commands
php artisan migrate
php artisan key:generate
```
