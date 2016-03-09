#! /bin/env bash
set -u;
set -e;
gnuplot -e "value=38.;max_value=60." gradient_dial.gnuplot;
