FROM python:3

# Set the working directory to /app
WORKDIR /app

COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# open port 5000
EXPOSE 5000

CMD ["python", "app.py"]