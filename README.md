# docker-slim-demo

> **NOTE:** perhaps [this tutorial](https://community.slim.ai/t/simple-recommendation-system-with-python-scikit-learn-and-slim-toolkit/95) is the way 

In [app.py](app.py), we have a simple Python Flask app that listens on port 5123. The app just returns a simple message. It is built with a ridiculously large base image. The app is built with the following command:

```bash
docker build -t test-to-build .    
```

Let it build, and then:

```bash
# NOTE: if port 5001 is already in use, change the (left) port mapping
docker run --name RONNIE -dp 5001:5123 test-to-build   
```