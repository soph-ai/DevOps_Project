#Use Python 3.6 as a base image
FROM python:3.6
WORKDIR /backend
# Copy contents into image
 COPY . .
# install pip dependencies from requirements file
 RUN pip3 install -r requirements.txt

ENV MYSQL_ROOT_PASSWORD=password MYSQL_DB=flask-db
ENV SECRET_KEY=abcdefg
# Expose correct port
EXPOSE 5000
# Create an entrypoint
entrypoint ["python3", "app.py"]