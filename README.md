# docker-slim-demo

> **NOTE:** This repo is a Frankenstein with patches and inspiration from [this slim.ai tutorial](https://community.slim.ai/t/simple-recommendation-system-with-python-scikit-learn-and-slim-toolkit/95), [flask quickstart](https://flask.palletsprojects.com/en/2.2.x/quickstart/), [Docker's how-to-push-to-Docker-hub](https://docs.docker.com/get-started/04_sharing_app/), and of course LOADS of debugging with ChatGPT and `docker logs`.

In [app.py](app.py), we have a simple Python Flask app that listens on port 5123. The app just returns a simple message. It is built with a ridiculously large base image. On my system (MacBook Air M1), the app can be built with the following command:

```bash
FLASK_APP=main.py flask run
```

For some reason, this opens the app on port 5000, not 5123. I don't know why. But it works. Surf into `http://0.0.0.0:5000` and you should it working.

## Dockerfile

This is the dockerfile:

```dockerfile
FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY ./app /app

WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "main.py"]
```

## Run with Docker

```bash
docker build -t <name-of-app> .    
```

Let it build, and then:

```bash
# NOTE: if port 5001 is already in use, change the (left) port mapping
docker run --rm --name <name-of-container> -dp 5001:5123 <name-of-app>   
```

## Push to Docker Hub

To push the image to Docker Hub, you need to tag it first:

```bash
docker tag <name-of-app> <your-docker-hub-username>/<name-of-app>
```

Then, push it:

```bash
docker push <your-docker-hub-username>/<name-of-app>
```

## Slimming it down 
After the image is pushed to Docker Hub, you can Harden the image via [slim.ai](slim.ai). Just remember to mark the `app`-folder as non-deleteable. When it is pushed to Docker Hub as a slim version, you run it with:

```bash
docker run --rm --name linus -dp 5001:5123 linusost/scotch-model:latest-slim
```


# Text

Me and Praneet have build an application 

So why would you want to slim it down?
- dev vs prod
- smaller image, faster and more agile
- can be done by hand, but extremely time consuming
- Reducing attack surface
    - shells
    - environment variables
    - open ports
    - files with special permission