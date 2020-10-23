#!/bin/sh

input1=0
input2=0
input3=0
input1_hold=0
input2_hold=0
input3_hold=0

echo "" >> /tmp/regfile

while true
do

  x=1
  input="/tmp/iofile"
  while IFS= read -r line
  do
    if [ $x -eq 1 ]; then
      input1=$line
      #echo "input 1 = $line"
    fi
    if [ $x -eq 2 ]; then
      input2=$line
      #echo "input 2 = $line"
    fi
    if [ $x -eq 3 ]; then
      input3=$line
      #echo "input 3 = $line"
    fi

    x=`expr $x + 1`

  done < "$input"


  if [ $input1 -ne $input1_hold ] || [ $input2 -ne $input2_hold ] || [ $input3 -ne $input3_hold ] ; then
    if [ $input1 -eq 0 ]; then
      echo '[{"input1":"0"},' > /tmp/regfile
      #echo "input1 0"
    else
      echo '[{"input1":"1"},' > /tmp/regfile
      #echo "input1 1"
    fi

    if [ $input2 -eq 0  ]; then
      echo '"input2":"0",' >> /tmp/regfile
      #echo "input2 0"
    else
      echo '"input2":"1",' >> /tmp/regfile
      #echo "input2 1"
    fi

    if [ $input3 -eq 0  ]; then
      echo '"input3":"0"}]' >> /tmp/regfile
      #echo "input3 0"
    else
      echo '"input3":"1"}]' >> /tmp/regfile
      #echo "input3 1"
    fi

    #echo "sleep 6"
    sleep 6

  else
    echo "" > /tmp/regfile
    #echo "Schrijf lege regfile"
  fi

  input1_hold=$input1
  input2_hold=$input2
  input3_hold=$input3


  #echo "sleep 1"
  sleep 1

done