FRONT_END_BINARY=frontApp
BROKER_BINARY=brokerApp
AUTH_BINARY=authApp
LOGGER_BINARY=loggerServiceApp
MAIL_BINARY=mailerApp
LISTENER_BINARY=listenerApp
FRONT_BINARY=frontEndApp

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_broker build_auth build_logger build_mail build_listener
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

# build_front_linux: builds the front end binary as a linux executable
build_front_linux:
	@echo "Building front end linux binary..."
	cd ../front-end && env GOOS=linux CGO_ENABLED=0 go build -o ${FRONT_BINARY} ./cmd/web
	@echo "Done!"

## build_broker: builds the broker binary as a linux executable
build_broker:
	@echo "Building broker binary..."
	cd ../broker-service && env GOOS=linux CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api
	@echo "Done!"

## build_logger: builds the logger binary as a linux executable
build_logger:
	@echo "Building logger binary..."
	cd ../logger-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LOGGER_BINARY} ./cmd/api
	@echo "Done!"

## build_listener: builds the listener binary as a linux executable
build_listener:
	@echo "Building listener binary..."
	cd ../listener-service && env GOOS=linux CGO_ENABLED=0 go build -o ${LISTENER_BINARY} .
	@echo "Done!"

## build_auth: builds the auth binary as a linux executable
build_auth:
	@echo "Building auth binary..."
	cd ../authentication-service && env GOOS=linux CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/api
	@echo "Done!"

## build_mail: builds the mail binary as a linux executable
build_mail:
	@echo "Building mail binary..."
	cd ../mail-service && env GOOS=linux CGO_ENABLED=0 go build -o ${MAIL_BINARY} ./cmd/api
	@echo "Done!"

## build_front: builds the frone end binary
build_front:
	@echo "Building front end binary..."
	cd ../front-end && env CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} ./cmd/web
	@echo "Done!"

## start: starts the front end
start: build_front
	@echo "Starting front end"
	cd ../front-end && ./${FRONT_END_BINARY} &

## stop: stop the front end
stop:
	@echo "Stopping front end..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"


# docker swarm init
# docker stack deploy -c swarm.yml myapp
# docker service 
# docker stack rm myapp
# docker swarm leave
# docker swarm leave --force


# scale service
# docker service scale myapp_logger_service=2

# update service
# docker service update --image najibfikri/go-udemy-logger:1.0.1 myapp_logger_service


# Minikube (kubernetes)
# minikube start --nodes=2
# minikube delete
# minikube start --nodes=2
# minikube stop
# minikube start 
# minikube status
# minikube dashboard

# kubectl get pods
# kubectl get pods -A

# kubectl apply -f k8s

# kubectl get svc

# kubectl get deployments

# kubectl apply -f k8s/rabbit.yml

# kubectl logs <pods_name>

# kubectl get deployments
# kubectl delete deployments broker-service mongo rabbitmq
# kubectl get deployments

# kubectl get svc
# kubectl delete svc broker-service mongo rabbitmq
# kubectl get svc




# kubectl get svc
# kubectl delete svc broker-service
# kubectl expose deployment broker-service --type=LoadBalancer --port=8080 --target-port=8080 
# minikube tunnel



# minikube addons enable ingress
# kubectl apply -f ingress.yml
# kubectl get ingress
# <add dns to host>
# minikube tunnel