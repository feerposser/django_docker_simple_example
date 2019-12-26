# Base Image
FROM python:3.6

ENV PYTHONUNBUFFERED 1
ENV DEBUG 0

# create and set working directory
RUN mkdir /app

COPY requirements.txt /app

WORKDIR /app

# Add current directory code to working directory
ADD ./example /app/
RUN pip install -r requirements.txt
RUN python manage.py collectstatic --noinput

EXPOSE 8000
CMD gunicorn example.wsgi:application --bind 0.0.0.0:8000