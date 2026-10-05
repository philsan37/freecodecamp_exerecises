#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

# query services for service listing
while true; do
    psql --username=freecodecamp --dbname=salon -t -A -c "SELECT service_id || ') ' || name FROM services;"
    
    read SERVICE_ID_SELECTED

    # Check if id exists
    SERVICE_EXISTS=$(psql --username=freecodecamp --dbname=salon -t -A -c "SELECT COUNT(*) FROM services WHERE service_id = $SERVICE_ID_SELECTED;" | xargs)

    if [ "$SERVICE_EXISTS" -eq 1 ]; then
        break
    else
        echo -e "\nI could not find that service. What would you like today?\n"
    fi
done

# Fetch the name of the service
SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon -t -A -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;" | xargs)

#Prompt for phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

#Check if customer exists
CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon -t -A -c "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';" | xargs)

# If customer doesn't exist, ask for name and save
if [ -z "$CUSTOMER_NAME" ]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    psql --username=freecodecamp --dbname=salon -c "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');" > /dev/null
fi

#Prompt for time
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

#Insert the appointment
psql --username=freecodecamp --dbname=salon -c "INSERT INTO appointments (customer_id, service_id, time) VALUES ((SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'), $SERVICE_ID_SELECTED, '$SERVICE_TIME');" > /dev/null

#confirmation message
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

