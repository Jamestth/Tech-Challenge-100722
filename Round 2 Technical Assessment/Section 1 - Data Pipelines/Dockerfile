FROM python:3.9.7

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update
RUN apt-get -y install cron
RUN apt-get -y install vim
COPY . .

RUN echo "$PWD"
WORKDIR /
RUN crontab /crontab
CMD ["cron", "-f"]