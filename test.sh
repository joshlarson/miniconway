#!/bin/bash

result="All tests passed"

for x in test_files/*.test
do
  ruby -n conway.rb < $x > run.out

  diff run.out $x.out > $x.errors

  if [ $? != "0" ]
  then
    result=""
    echo "$x failed (see $x.errors for details)"
  else
    rm $x.errors
  fi

  rm run.out
done

if [ "$result" != "" ]
then
  echo $result
  exit 0
fi

exit 1
