FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=password 
ENV MYSQL_DB=flask-db
ENV SECRET_KEY=abcdefg
ENV TEST_DATABASE_URI
COPY ./Create.sql /docker-entrypoint-initdb.d

