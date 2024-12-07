.PHONY:build
build: 
	@if [ -z "$(SERVICE)" ]; then \
		echo "Error: SERVICE flag is required. Usage: make generate-proto SERVICE=<service_name>"; \
		exit 1; \
	fi

	@if [ -z "$(TAG)" ]; then \
		echo "Error: TAG flag is required. Usage: make generate-proto TAG=<1.0.0>"; \
		exit 1; \
	fi

	cd $(SERVICE)
	docker build -f $(SERVICE).dockerfile -t najibfikri/go-udemy-$(SERVICE):$(TAG) .

.PHONY:push
push:
	@if [ -z "$(SERVICE)" ]; then \
		echo "Error: SERVICE flag is required. Usage: make generate-proto SERVICE=<service_name>"; \
		exit 1; \
	fi

	@if [ -z "$(TAG)" ]; then \
		echo "Error: TAG flag is required. Usage: make generate-proto TAG=<1.0.0>"; \
		exit 1; \
	fi

	docker push najibfikri/go-udemy-$(SERVICE):$(TAG)

.PHONY: build-and-push
build-and-push:
	@if [ -z "$(SERVICE)" ]; then \
		echo "Error: SERVICE flag is required. Usage: make generate-proto SERVICE=<service_name>"; \
		exit 1; \
	fi

	@if [ -z "$(TAG)" ]; then \
		echo "Error: TAG flag is required. Usage: make generate-proto TAG=<1.0.0>"; \
		exit 1; \
	fi

	cd $(SERVICE) && docker build -f $(SERVICE).dockerfile -t najibfikri/go-udemy-$(SERVICE):$(TAG) .
	docker push najibfikri/go-udemy-$(SERVICE):$(TAG)
