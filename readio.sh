#!/bin/sh


while true
do

  val=`ubus call ioman.gpio.dio0 status`
  io1=`echo "$val" | grep '"value": "1",'`

  val=`ubus call ioman.gpio.dio1 status`
  io2=`echo "$val" | grep '"value": "1",'`

  val=`ubus call ioman.gpio.dio2 status`
  io3=`echo "$val" | grep '"value": "1",'`

  if [ -z "$io1" ]; then
    echo 0 > /tmp/iofile
    #echo "0"
  else
    echo 1 > /tmp/iofile
    #echo "1"
  fi

  if [ -z "$io2" ]; then
    echo 0 >> /tmp/iofile
  else
    echo 1 >> /tmp/iofile
  fi

  if [ -z "$io3" ]; then
    echo 0 >> /tmp/iofile
  else
    echo 1 >> /tmp/iofile
  fi

  sleep 1
  #echo "sleep"

done