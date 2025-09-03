# FROM rasa/rasa:3.6.21

# WORKDIR /app

# # Minimal extra dependencies
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# RUN rasa train --force

# EXPOSE 5005

# CMD ["rasa", "run", "--enable-api", "--cors", "*"]


FROM rasa/rasa:3.6.21

WORKDIR /app

COPY . .

RUN rasa train --force

# Install supervisord (Python version, lightweight)
RUN pip install supervisord

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5005 5055

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
