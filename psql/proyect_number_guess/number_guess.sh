#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USER

USER_INFO=$($PSQL "SELECT * FROM user_info WHERE username='$USER'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USER! It looks like this is your first time here."
  ADD_USER=$($PSQL "INSERT INTO user_info(username) VALUES('$USER')")
else
  echo "$USER_INFO" | while read USER_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

USER_GUESS=-1
echo "Guess the secret number between 1 and 1000:"

ATTEMPTS=0
while [[ $USER_GUESS -ne $NUMBER ]]
do
  read USER_GUESS
  if [[ ! $USER_GUESS =~ ^[0-9]+$  ]];
  then
    echo "That is not an integer, guess again:"
  elif [[ $USER_GUESS -gt $NUMBER ]];
  then
    echo "It's lower than that, guess again:"
  elif [[ $USER_GUESS -lt $NUMBER ]];
  then
    echo "It's higher than that, guess again:"
  fi    
  ((ATTEMPTS=ATTEMPTS+1))
done

# SAVE GAME INFO
GAMES_INFO=$($PSQL "SELECT games_played,best_game FROM user_info WHERE username='$USER'")
echo "$GAMES_INFO" | while read GAMES_PLAYED BAR BEST_GAME
do
GAMES_ENDED=$(($GAMES_PLAYED+1))
UPDATE_GAMES=$($PSQL "UPDATE user_info SET games_played=$GAMES_ENDED WHERE username='$USER'")
if [[ -z $BEST_GAME || $ATTEMPTS -lt $BEST_GAME ]];
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE user_info SET best_game=$ATTEMPTS WHERE username='$USER'")
fi
done
echo "You guessed it in $ATTEMPTS tries. The secret number was $USER_GUESS. Nice job!"