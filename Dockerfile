FROM rasa/rasa:3.6.21

WORKDIR /app

COPY requirements.txt ./

# Add system deps for psycopg2, ujson, httptools, etc.
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc g++ libpq-dev python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN if [ -s requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

COPY . .

RUN rasa train --force

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--cors", "*"]
