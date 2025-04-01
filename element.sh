#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument was provided
if [ -z "$1" ]
then
  echo "Please provide an element as an argument."
else
  # Sanitize the input by trimming whitespace
  ELEMENT_INPUT=$(echo "$1" | xargs)

  # Query the database to find the element by atomic number, symbol, or name
  ELEMENT_INFO=$($PSQL "
    SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
    FROM elements e
    INNER JOIN properties p ON e.atomic_number = p.atomic_number
    INNER JOIN types t ON p.type_id = t.type_id
    WHERE e.atomic_number::text = '$ELEMENT_INPUT'
    OR e.symbol ILIKE '$ELEMENT_INPUT'
    OR e.name ILIKE '$ELEMENT_INPUT';
  ")

  # Check if the query returned any results
  if [ -z "$ELEMENT_INFO" ]
  then
    echo "I could not find that element in the database."
  else
    IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$ELEMENT_INFO"
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
fi

