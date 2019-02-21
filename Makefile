all: build push

DOCKERREPO       := kubeforge/dhcp-server

build:
				docker build -t $(DOCKERREPO) -f Dockerfile .

push: build
			docker push $(DOCKERREPO)
