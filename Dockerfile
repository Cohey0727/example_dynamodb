FROM python:3.7.4

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils gettext
RUN mkdir /app; mkdir /app/dynamodb_example


WORKDIR /app
COPY dynamodb_example /app/dynamodb_example
COPY requirements.txt /app/
COPY manage.py /app/

RUN pip install -r requirements.txt


EXPOSE 8080
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
