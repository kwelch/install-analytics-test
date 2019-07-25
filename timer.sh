#!/bin/bash

mkdir -p ./.tmp

tmp_file="./.tmp/install_time"

get_time_in_nanoseconds() {
  node -e 'console.log(Date.now())'
}

if [ "$1" = "start" ]; then
  get_time_in_nanoseconds > $tmp_file
fi

if [ "$1" = "end" ]; then
  if [ ! -f $tmp_file ]; then
    echo "Timer ended without being started"
    exit 9;
  fi
  start_time=$(cat $tmp_file)
  end_time="$(get_time_in_nanoseconds)"
  duration=$(expr "$end_time" - "$start_time")

  echo "timer stopped - ${duration}ms";
  rm $tmp_file
fi