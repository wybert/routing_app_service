# routing_app_service

This repo contains the whole backend and frontend code for the routing app.

## requirements

1. You need 100 GB RAM and 500 GB of disk space to run the app.
2. Please install docker and docker compose
3. Install git and clone this repo

If you want run the app in one command in docker compose, run the following command in the root directory of the project:

```bash
docker compose up
```

If you want only run the backend, run the following command to build the image and run the container:


```bash
docker build -t routing_app_service:0.2 .
docker run -p 5000:5000 routing_app_service:0.2
```
It use 43 GB of RAM. When running the container, it need serveral minutes to ready for requests.
