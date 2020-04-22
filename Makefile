.PHONY: all

help:
	@echo "Usage:"
	@echo "  make [help] - Display this message"
	@echo "  make build  - Build the docker image"
	@echo "  make shell  - Run a shell in the container"
	@echo "  make run    - Run the docker image"

build:
	docker build --rm -t ssh-server:local .

shell:
	docker run -ti --rm -p 2222:22 ssh-server:local /bin/bash -l || true

run:
	docker run -ti --rm -p 2222:22 ssh-server:local || true
