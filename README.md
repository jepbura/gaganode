# Gaga Node for Docker

Simple Docker to install Gaga Node as a Docker platform.

## Usage

Define the following environment variable to configure Gaga Node.

| Variable     | Description                                                                              | Optional                                                                                                        |
| ------------ | ---------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| DOWNLOADLINK | Add the latest download link from [Gaganode](https://dashboard.gaganode.com/install_run) | Like=https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz |
| FILENAME     | Add the name of the installation file                                                    | Like=apphub-linux-amd64.tar.gz                                                                                  |
| TOKEN        | Your token on Gaga Node                                                                  | xxxxxxxxx                                                                                                              |

## For example

`docker run -d -e DOWNLOADLINK=https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz -e FILENAME=apphub-linux-amd64.tar.gz -e TOKEN=xxxxxxxxx --name gaganode jepbura/gaganode:latest`

## Docker hub

My Docker at Docker Hub: [jepbura/gaganode](https://hub.docker.com/r/jepbura/gaganode/)
