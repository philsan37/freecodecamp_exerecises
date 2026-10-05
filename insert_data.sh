#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#extract unique team from winner, opponent column and make it single 
#column then filter for duplicates, insert the output to teams table
awk -F',' 'NR > 1 {print $3; print $4}' games.csv | sort -u | while read TEAM
do
  # Insert the team name directly into the teams table
  $PSQL "INSERT INTO teams(name) VALUES('$TEAM')"
done

#populate games table
tail -n +2 games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # 2. Query the teams table to get the winner_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  # 3. Query the teams table to get the opponent_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # 4. Insert the game data into the games table using the retrieved IDs
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) \
        VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)"
done
