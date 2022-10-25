#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
  
  echo "Welcome to My Salon, how can I help you?"
  echo -e  "\n1) cut\n2) color\n3) perm\n4) style\n5) trim\n"
  read MAIN_MENU_SELECTION

  case $MAIN_MENU_SELECTION in
    1) APPOINTMENT $MAIN_MENU_SELECTION "cut";;
    2) APPOINTMENT $MAIN_MENU_SELECTION "color";;
    3) APPOINTMENT $MAIN_MENU_SELECTION "perm";;
    4) APPOINTMENT $MAIN_MENU_SELECTION "style";;
    5) APPOINTMENT $MAIN_MENU_SELECTION "trim";;
    *) MAIN_MENU "I could not find that service. What would you like today?";;
  esac
}



APPOINTMENT(){
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$2

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU