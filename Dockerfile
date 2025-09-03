FROM python:3.10-slim-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc g++ libpq-dev python3-dev git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install rasa==3.6.21 rasa-sdk==3.6.2

COPY requirements.txt ./
RUN if [ -s requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

COPY . .

RUN rasa train --force

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--cors", "*"]
