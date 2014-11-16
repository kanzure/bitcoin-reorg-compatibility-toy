from setuptools import setup

# This is handled by pip and requirements.txt. Since this is not a real package
# being published anywhere, it's somewhat safe to assume that setup.py will
# never be responsible for installing everything on its own.
requires = []

setup(
    name="reorgcompatservice",
    version="0.0.0",
    description="Bitcoin reorg-compatibility service example.",
    author="Bryan Bishop",
    author_email="kanzure@gmail.com",
    url="https://github.com/bitcoin-reorg-compatibility-toy",
    install_requires=requires,
    license="BSD",
    classifiers=(
        "Intended Audience :: Developers",
    ),
)
