# docker-slim-demo

> **NOTE:** perhaps [this tutorial](https://community.slim.ai/t/simple-recommendation-system-with-python-scikit-learn-and-slim-toolkit/95) is the way 

In [app.py](app.py), we have a simple Python Flask app that listens on port 5000. The app just returns a simple message. It is built with `python:latest` as the base image, which is ridiculously large. The app is built with the following command:

```bash
docker build -t flask-test .     
```

Let it build, and then:

```bash
# NOTE: if port 5000 is already in use, change the (left) port mapping
docker run -d -p 5000:5000 flask-test   
```