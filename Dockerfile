FROM rasa/rasa:3.6.21

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY requirements.txt ./

# Install system dependencies safely
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    libpq-dev \
    python3-dev \
    apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN if [ -s requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

COPY . .

RUN rasa train --force

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--cors", "*"]
