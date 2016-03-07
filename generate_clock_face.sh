#! /bin/env bash
set -u;
set -e;
time=$(date "+%-H %-M %-S");
hour=$(echo ${time} | awk '{print $1}');
minute=$(echo ${time} | awk '{print $2}');
second=$(echo ${time} | awk '{print $3}');
gnuplot -e "hour=${hour};minute=${minute};second=${second}" clock.gnuplot;
