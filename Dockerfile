FROM python:3.12-alpine

RUN apk add libpq-dev gcc musl-dev openldap-dev

WORKDIR /usr/src/app

COPY helios-server/requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY --chmod=555 helios_create_admin /bin/

EXPOSE 80

CMD sh -c "python manage.py makemigrations && python manage.py migrate && helios_create_admin && (python manage.py runserver 0.0.0.0:80 & celery -A helios worker)"
