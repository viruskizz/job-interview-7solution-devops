NAME=7solution
TAG=devops

$(NAME): all

all: build run

build:
	docker build -t ${NAME}:${TAG} .

run:
	docker run --rm -p 8080:8080 ${NAME}:${TAG}

.phony: build run