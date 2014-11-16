.PHONY: touch build install-dev-deps clean

# The "touch" target is useful for not losing docker's build cache when
# switching between git branches.
touch:
	@echo "HACK: Reset timestamps on git working directory files (docker cache invalidation reasons)."
	@find ./ | xargs touch -t 200001010000.00

# Build the docker container based on ./Dockerfile here.
build: touch
	sudo docker build -t reorgcompat .

install-dev-deps:
	sudo apt-get install -y $(cat ./requirements-dev.apt)

clean:
	rm -fr reorgcompatservice.egg-info/
