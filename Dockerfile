FROM python:3.10-alpine

RUN apk add libpq-dev gcc musl-dev openldap-dev

WORKDIR /usr/src/app

COPY helios-server/requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD python manage.py runserver 0.0.0.0:80
