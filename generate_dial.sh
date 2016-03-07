#! /bin/env bash
set -u;
set -e;
test_value=$(date "+%-S");
gnuplot -e "value=${test_value};max_value=60." dial.gnuplot;
