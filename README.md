## Laravel setup guide for development

### Clone an Laravel starter kit

```shell
git clone https://github.com/laravel/vue-starter-kit
mv vue-starter-kit project-name
cd project-name
rm -rf .git
```

#### Recommended `.env` for mysql

```dotenv
APP_NAME="Project Name"

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=project-name
DB_USERNAME=user
DB_PASSWORD=pass
DB_VOLUME=project-name_mysql_data
```

If using [Supabase](https://supabase.com/docs/guides/getting-started/quickstarts/laravel):

```dotenv
DB_CONNECTION=pgsql
DB_URL=postgres://postgres.xxxx:password@xxxx.pooler.supabase.com:5432/postgres
```

- Remove the `compose.yml` in this case.

### Install dependencies (php, composer & node):

1. Install Nix:

```shell
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

echo -e "experimental-features = nix-command flakes\ntrusted-users = root $(whoami)" | sudo tee -a /etc/nix/nix.conf
```

2. Install direnv using Nix:

```shell
nix profile install nixpkgs#direnv
nix profile install nixpkgs#nixfmt

# ~/.zshrc: eval "$(direnv hook zsh)"
```

3. Use `flake.nix` to install required packages/dependencies
