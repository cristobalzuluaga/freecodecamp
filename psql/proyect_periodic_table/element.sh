#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


# if no arguments passed exit
if [[ $# -eq 0 ]] 
then
  echo "Please provide an element as an argument."
  exit 0
fi

# check if argument is a number
if [[ ! $1 =~ ^[0-9]+$  ]]; 
then
  # get element info by any string property
  ELEMENT_INFO=$($PSQL "SELECT * FROM elements NATURAL JOIN properties NATURAL JOIN types WHERE symbol='$1' or name='$1'")
else
  # get element info by atomic number
  ELEMENT_INFO=$($PSQL "SELECT * FROM elements NATURAL JOIN properties NATURAL JOIN types WHERE atomic_number=$1")
fi

# if no elements in database
if [[ -z $ELEMENT_INFO ]]
then
  echo "I could not find that element in the database."
else
  echo "$ELEMENT_INFO" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR ELEMENT_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi