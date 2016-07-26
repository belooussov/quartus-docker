.PHONY: all build bash run pull

# http://download.altera.com/akdlm/software/acdsinst/16.0/211/ib_tar/Quartus-lite-16.0.0.211-linux.tar
# quartus/QuartusLiteSetup-16.0.0.211-linux.run
# http://download.altera.com/akdlm/software/acdsinst/16.0.1/218/ib_tar/Quartus-lite-16.0.1.218-linux.tar
# http://download.altera.com/akdlm/software/acdsinst/16.0/211/ib_installers/cyclonev-16.0.0.211.qdz
# quartus/cyclonev-16.0.0.211.qdz
#
# tip: checkout path should be like this:
# mkdir -p  ~/code/github/belooussov
# cd ~/code/github/belooussov
# git clone https://github.com/belooussov/quartus-docker
#
NAME=quartus
AUTHOR=belooussov

all: build

download-deps:
	mkdir -p ./quartus
	wget http://download.altera.com/akdlm/software/acdsinst/16.0.1/218/ib_tar/Quartus-lite-16.0.1.218-linux.tar -o ./quartus/Quartus-lite-16.0.1.218-linux.tar
	wget http://download.altera.com/akdlm/software/acdsinst/16.0/211/ib_installers/cyclonev-16.0.0.211.qdz -o ./quartus/cyclonev-16.0.0.211.qdz

build:
	docker build -t $(AUTHOR)/$(NAME):latest .
	#cd image && docker build -t $(AUTHOR)/$(NAME):latest .
	#docker build --no-cache=false -t $(AUTHOR)/$(NAME):latest .

bash:
	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /dev:/dev -v workspace:/workspace --workdir=/workspace $(AUTHOR)/$(NAME):latest /bin/bash

run:
	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /dev:/dev -v workspace:/workspace --workdir=/workspace $(AUTHOR)/$(NAME):latest

pull:
	docker pull docker.io/$(AUTHOR)/$(NAME):latest

push:
	docker tag $(AUTHOR)/$(NAME):latest docker.io/$(AUTHOR)/$(NAME):latest
	docker push docker.io/$(AUTHOR)/$(NAME):latest
