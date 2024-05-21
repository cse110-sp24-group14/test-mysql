#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: add container name as command line argument"
    exit 1
fi

# Set variables
CONTAINER_NAME=$1
MYSQL_USERNAME="root"
MYSQL_PASSWORD="pw"
DATABASE_NAME="test_db_1"
SQL_FILE="dummy.sql"

# Pull MySQL image if not already present
docker pull mysql

# Run MySQL container
docker run --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$MYSQL_PASSWORD -p 3306:3306 -d mysql

# Wait for MySQL to start
sleep 10

# Copy SQL file into container
docker cp $SQL_FILE $CONTAINER_NAME:/$SQL_FILE

# Execute SQL script in MySQL container
docker exec -it $CONTAINER_NAME bash -c " mysql -u$MYSQL_USERNAME -p$MYSQL_PASSWORD < /$SQL_FILE"

echo "Database setup complete!"

