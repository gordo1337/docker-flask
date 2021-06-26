# our base image
FROM python:latest-alpine:latest

MAINTAINER Gudfriden:Brandtz

#local enviroment
ENV FLASK_APP=/app/app.py
WORKDIR=/usr/src/app

# Install python and pip
RUN apk add --update py-pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# tell the port number the container should expose
EXPOSE 5000

# run the application
RUN flask run --host=0.0.0.0 --port=5000 ["python", "/usr/src/app/app.py"]
