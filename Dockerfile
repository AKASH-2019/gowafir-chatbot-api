FROM rasa/rasa:3.6.21

WORKDIR /app

COPY requirements.txt ./
RUN if [ -s requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

COPY . .

RUN rasa train --force

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--cors", "*"]
