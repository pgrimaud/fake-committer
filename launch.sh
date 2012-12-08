#!/bin/bash
for (( c=365; c>=1; c-- ))
do
  NUMBER=$[ ( $RANDOM % 3 )  + 1 ]
  if [ "$NUMBER" -ne 3 ]
  then
    COMMIT=$[ ( $RANDOM % 10 )  + 2 ]
    #number of commits for the day
    for (( q=0; q<=$COMMIT; q++ ))
    do
      NOW=$(date -d "$c days ago" -R)
      echo $c$q >> index.pl
      git add -A && git commit --date="$NOW" -am "$c$q"
    done
  fi
done
