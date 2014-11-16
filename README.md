# bitcoin-reorg-compatibility-toy
**bitcoin-reorg-compatibility-toy** is a small python project to demonstrate the concept of "reorg-compatibility", which is basically the concept of ensuring that Bitcoin-related software is written in a way that handles blockchain reorgs in a well-defined or possibly even graceful way.

# Usage

## Installing development dependencies

See [requirements-dev.apt](requirements-dev.apt) for a list of packages required to develop and work with the software in this repository. Basically just run something like:

```
sudo apt-get install -y $(cat ./requirements-dev.apt)
```

## Building the docker container

```
make build
```

# Words of caution

## Only one docker container?

The toy in this repo is used in a docker container that runs bitcoind as well as the example software. This is a bad idea and it is not recommended.

## Private keys

Don't store private keys like in this repo. Don't sign from a hot wallet.

# License

BSD
