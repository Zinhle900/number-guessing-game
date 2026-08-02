#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username:"
read USERNAME_INPUT

# Check if username exists
USER_ROW=$($PSQL "SELECT username, games_played, best_game FROM players WHERE username='$USERNAME_INPUT'")

if [[ -z $USER_ROW ]]
then
  # New user - insert into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$USERNAME_INPUT', 0, 0)")
  echo -e "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
else
  # Existing user - parse the returned row
  GAMES_PLAYED=$(echo $USER_ROW | cut -d '|' -f 2)
  BEST_GAME=$(echo $USER_ROW | cut -d '|' -f 3)
  echo -e "Welcome back, $USERNAME_INPUT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
NUMBER_OF_GUESSES=0

echo -e "Guess the secret number between 1 and 1000:"
read GUESS

while true
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
    read GUESS
    continue
  fi

  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
    read GUESS
  else
    echo -e "It's higher than that, guess again:"
    read GUESS
  fi
done

echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

# Update stats in the database
UPDATE_RESULT=$($PSQL "UPDATE players SET games_played = games_played + 1 WHERE username='$USERNAME_INPUT'")

if [[ -z $USER_ROW ]]
then
  # First game for this user - set best_game directly
  $PSQL "UPDATE players SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME_INPUT'" > /dev/null
else
  # Only update best_game if this game was better (or no best_game set yet)
  $PSQL "UPDATE players SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME_INPUT' AND (best_game = 0 OR best_game > $NUMBER_OF_GUESSES)" > /dev/null
fi
