FROM alpine:latest

#local enviroment
ENV FLASK_APP=/app/app.py
WORKDIR /app

# Install python and pip
RUN apk add --update py-pip

# install Python modules needed by the Python app
COPY requirements.txt .
RUN pip install --no-cache-dir -r /app/requirements.txt

# copy files required for the app to run
COPY app.py .

# tell the port number the container should expose
EXPOSE 5000

# run the application
RUN flask run --host=0.0.0.0 --port=5000
