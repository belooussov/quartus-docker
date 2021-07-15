.PHONY: build run

NAME=foo
AUTHOR=belooussov

build:
	docker build -t $(AUTHOR)/$(NAME):latest .

run:
	-pkill socat
	./go.sh
