# Dockerized Screaming Frog SEO Spider
## Run Screaming Frog cli in docker container
- Based on Ubuntu 18.04
- Launches the X virtual frame buffer (Xvfb) which emulates an X11 display (For Screamingfrog's embeded browser working)

## Building
- Copy your licence.txt to current directory
- run `docker build -t screamingfrog .`

## Usage

```sh
docker run --rm --mount source=/tmp/crawler,target=/mnt/crawler,type=bind screamingfrog --crawl https://example.com \
  --headless --save-crawl --timestamped-output --output-folder /mnt/crawler
```
