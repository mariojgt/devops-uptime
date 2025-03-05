.PHONY: start stop restart status logs shell help

# Default port for Uptime Kuma
UPTIME_KUMA_PORT ?= 3001

help:
	@echo "Available commands:"
	@echo "  make start         - Start Uptime Kuma container"
	@echo "  make stop          - Stop Uptime Kuma container"
	@echo "  make restart       - Restart Uptime Kuma container"
	@echo "  make status        - Check status of Uptime Kuma container"
	@echo "  make logs          - View logs from Uptime Kuma container"
	@echo "  make shell         - Open a shell in the Uptime Kuma container"
	@echo ""
	@echo "You can specify a custom port by setting UPTIME_KUMA_PORT:"
	@echo "  make start UPTIME_KUMA_PORT=8080"

start:
	@echo "Starting Uptime Kuma on port $(UPTIME_KUMA_PORT)..."
	@UPTIME_KUMA_PORT=$(UPTIME_KUMA_PORT) docker-compose up -d
	@echo "Uptime Kuma is running at http://localhost:$(UPTIME_KUMA_PORT)"

stop:
	@echo "Stopping Uptime Kuma..."
	@docker-compose down
	@echo "Uptime Kuma stopped"

restart: stop start

list:
	@docker-compose ps

status:
	@docker-compose ps

logs:
	@docker-compose logs -f

shell:
	@docker-compose exec uptime-kuma sh
