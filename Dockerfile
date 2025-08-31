# Dockerfile

# Use the official Python 3.9 image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all your project files into the container
COPY . .

# Tell the container that the app will listen on port 7860
EXPOSE 7860

# Command to run your Flask app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:7860", "app:app"]
