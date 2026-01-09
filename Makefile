.PHONY: help install dev up down logs migrate fresh test format clean

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install all dependencies
	pnpm install
	composer install

dev: ## Start the development server
	composer run dev

up: ## Start Docker containers
	docker compose up -d

down: ## Stop Docker containers
	docker compose down

logs: ## Show Docker container logs
	docker compose logs -f

migrate: ## Run database migrations
	php artisan migrate

fresh: ## Fresh migration with seeders
	php artisan migrate:fresh --seed

test: ## Run tests
	php artisan test

format: ## Format code with Prettier
	pnpm exec prettier --write .

clean: ## Remove build artifacts and dependencies
	rm -rf node_modules vendor public/build
