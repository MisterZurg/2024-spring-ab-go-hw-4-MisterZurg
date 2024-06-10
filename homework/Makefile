.PHONY: deploy destroy
deploy:
	docker compose -f ./docker-compose.yml rm && \
	docker compose -f ./docker-compose.yml build --no-cache && \
	docker compose -f ./docker-compose.yml up

destroy:
	docker-compose -f ./docker-compose.yml down