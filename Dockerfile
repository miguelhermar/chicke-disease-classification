FROM python:3.10-slim-buster

# updates every package manager and installs awscli for the deployment in AWS
RUN apt update -y && apt install -y awscli gcc python3-dev && apt-get clean
# creates one app directory where the model will be built
WORKDIR /app

# it copies all the code and puts it inside it
COPY . /app

# installs requirements
RUN pip install --timeout=300 -r requirements.txt

#since it's a Linux machine where the deployment will happen, one needs to specify the python version
CMD ["python3", "app.py"]