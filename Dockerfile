# Use a specific Rasa base image (Python 3.10 is already bundled in official builds)
FROM rasa/rasa:3.6.21

WORKDIR /app

# Copy requirements first (for caching)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Train model
RUN rasa train --force

# Expose Rasa server port
EXPOSE 5005

# Run Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*"]
