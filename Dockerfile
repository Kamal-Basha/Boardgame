FROM adoptopenjdk/openjdk11
    
EXPOSE 8080
 
ENV APP_HOME /usr/src/app

COPY target/*.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

CMD ["java", "-jar", "app.jar"]

#python dokcer file 

# Use a base image
FROM python:3.9-slim

# Set the environment variable
ENV APP_HOME /usr/src/app

# Set the working directory inside the container
WORKDIR $APP_HOME

# Copy the application files into the container
COPY . .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python", "app.py"]
