# Use a specific Rasa base image with Python 3.10
FROM rasa/rasa:3.6.21-py310

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to optimize Docker caching
COPY requirements.txt ./

# Install all the dependencies from your requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files into the container
COPY . .

# Run the Rasa model training
RUN rasa train --force

# Expose the port for the Rasa server
EXPOSE 5005

# Set the command to run the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*"]