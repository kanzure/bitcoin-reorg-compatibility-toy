# bitcoin-reorg-compatibility-toy
**bitcoin-reorg-compatibility-toy** is a small python project to demonstrate the concept of "reorg-compatibility". Any software implementing a Bitcoin service must be reorg-compatible except in the most mundane and stateless scenarios. Reorg-compatibility is when software is written in a way that aggressively correctly handles reorgs. Although reorg-compatibility has many benefits, in general it is good to prefer architecture that does not need to be concerned with blockchain reorganizations.

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

Never store private keys in production.

# License

BSD
