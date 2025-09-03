# Use a specific Rasa base image with Python 3.10
FROM rasa/rasa:3.6.21-py310

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install all the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run the Rasa model training when the container is built
RUN rasa train --force

# Expose the port for the Rasa server
EXPOSE 5005

# Set the command to run the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*"]