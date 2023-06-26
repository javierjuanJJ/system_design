FROM python:3.11

RUN apt-get update \
  && apt-get install -y --no-install-recommends --no-install-suggests \
  build-essential default-libmysqlclient-dev \
  && pip install --no-cache-dir --upgrade pip

WORKDIR /app
COPY ./requirements.txt /app
RUN pip install --no-cache-dir --requirement /app/requirements.txt
COPY . .

EXPOSE 5000

ENV FLASK_APP=app.py
CMD ["flask", "run", "--host", "0.0.0.0"]