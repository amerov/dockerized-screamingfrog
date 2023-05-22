# Dockerized Screaming Frog SEO Spider
## Run Screaming Frog cli in docker container
- Based on Ubuntu 22.04
- Launches the X virtual frame buffer (Xvfb) which emulates an X11 display (For Screamingfrog's embeded browser working)

## Building
- Copy your licence.txt to current directory
- run `docker build --build-arg HOST_UID=$(id -u) --build-arg HOST_GID=$(id -g) . -t screamingfrog`

## Usage

```sh
docker run --mount source=/tmp/crawls,target=/tmp/crawls,type=bind screamingfrog --crawl https://example.com \
  --headless --save-crawl --timestamped-output --output-folder /tmp/crawls
```
