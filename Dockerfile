# Use the same python version that I am using in my environment
FROM python:3.10-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app directory contents into the container at /app
COPY ./app /app/

# Set the environment variables
ENV FLASK_APP=hello.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# Expose the port the app runs on
EXPOSE 5000

# Run the command to start the Flask app
CMD [ "flask", "run" ]