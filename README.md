# Verifying that MySQL works

# Getting started

- Make sure docker is running in the background. `docker -v` should return a version number
- Run `bash docker-init.sh <container-name>`with the specific container name. The name should not matter. You may get some warnings but no errors
- Run `npm install` to install all necessary packages
- Run `node server.js` to start the server. This creates an HTTP server that allows our frontend to talk to our backend 


- To remove the container, run `docker-remove.sh <container-name>`. Container names can be found with `docker ps -a`

## Viewing the database

```
docker exec -it <container-name> bash
mysql -u root -p
<enter the password, which is "pw">
SHOW DATABASES;
USE test_db_1;
SHOW TABLES;
SELECT * FROM users;
```

## Random nerdy stuff
- What is docker?
  - Docker is a container service provider. Containers are like mini self-contained virtual computers that are standardized. 
- Why are we using docker when we can download MySQL itself?
  - Docker containers are generally standardized so we don't need to deal with configuration issues on each laptop. An "image" is pulled from dockerhub (similar to github) with the files needed for a MySQL server
- What is `dummy.sql`?
  - This file is loaded into the docker container inside of `docker-init.sh`. It essentially pre-populates the databse with dummy data we can use for development and testing
- Why are we using a database?
  - As long as the database is running, we the data we have for our frontend can persist. It is also a lot easier to handle compared to local storage since it is a lot more standardized