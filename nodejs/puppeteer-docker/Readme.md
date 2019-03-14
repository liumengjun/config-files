# Puppeteer docker

> https://github.com/GoogleChrome/puppeteer

## Build docker image

```sh
docker build -t node-puppeteer:puppeteer1_11-node10-alpine .
```

> [get the image](https://hub.docker.com/r/zhonglijunyi/node-puppeteer)

## Run example

```sh
docker run -it --rm node-puppeteer:puppeteer1_11-node10-alpine sh
# you may use `--volume list` option

cd /tmp
vi example.js # and input content, see 'example.js' file
node example.js # get example.png
```

## Get help

> https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md
