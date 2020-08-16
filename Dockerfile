# Dockerfile
#
FROM python:3.7
COPY flask_app /app/
#ADD setup.py /app
#ADD requirements.txt /app

RUN ls /app/
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install -e .
CMD ["gunicorn", "-b", "0.0.0.0:8000", "my_flask_app:app"]

#exec gunicorn -b :5000 --access-logfile - --error-logfile - my_flask_app:app
