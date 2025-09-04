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

# Copy everything
COPY . .

# Train Rasa model
RUN rasa train --force

# Copy start script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 5005 5055

CMD ["./start.sh"]

