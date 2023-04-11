FROM python:3.10.11-slim

COPY requirements.txt /tmp

RUN apt-get update && \
    apt-get clean && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

ENV PYTHONUNBUFFERED True
ENV APP_HOME /app
ENV PORT 8080
WORKDIR $APP_HOME
COPY app.py /app

# Run the web service on container startup. Here we use the gunicorn webserver,
# with one worker process and 8 threads.  For environments with multiple CPU
# cores, increase the number of workers to be equal to the cores available.
# Timeout is set to 0 to disable the timeouts of the workers to allow GKE to
# handle instance scaling.
CMD exec gunicorn --log-level=debug --bind :$PORT --workers 1 --threads 8 --timeout 0 --chdir $APP_HOME app:flask_app
