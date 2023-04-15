# a nginx webserver compatible with my Flask app
FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY ./app /app

WORKDIR /app

# Contents of requirements.txt:
# flask
# pandas
# scikit-learn
RUN pip install -r requirements.txt

# For slimming, I think "ENTRYPOINT" is key.
ENTRYPOINT ["python", "main.py"]