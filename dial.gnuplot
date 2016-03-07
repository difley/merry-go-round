hand_length = 0.7
mark_start_radius = 0.8
mark_end_radius = 1.0
mark_division = 10.

hand_angle(time, max_hand_value) = -pi*time/max_hand_value + pi
hand_angle_value = hand_angle(value, max_value)

set term svg dynamic enhanced butt linewidth 1
set output "dial.svg"
set multiplot
unset key
unset border
unset ytics
unset xtics
set xrange [-1:1]
set yrange [0:1]
set size ratio -1
unset rtics
unset raxis
r1 = 0.5
r2 = 1

set polar
set angle radians
set style fill solid noborder
plot [0.:0.6*pi/4.] '+' using 1:(r1):(r2) with filledcurves fillcolor rgb 'red'
plot [0.6*pi/4.:1.2*pi/3.] '+' using 1:(r1):(r2) with filledcurves fillcolor rgb 'yellow'
plot [1.2*pi/3.:2*pi/3.] '+' using 1:(r1):(r2) with filledcurves fillcolor rgb 'green'
plot [2./3.*pi:3./4.*pi] '+' using 1:(r1):(r2) with filledcurves fillcolor rgb 'yellow'
plot [3./4.*pi:pi] '+' using 1:(r1):(r2) with filledcurves fillcolor rgb 'red'

unset polar

do for [t=0:int(max_value):int(max_value/mark_division)] {
    mark_angle = hand_angle(t, max_value)
    set arrow from cos(mark_angle)*mark_start_radius, sin(mark_angle)*mark_start_radius to cos(mark_angle)*mark_end_radius, sin(mark_angle)*mark_end_radius nohead lw 6 lc rgb 'black'
}

set arrow from 0,0 to cos(hand_angle_value)*hand_length,sin(hand_angle_value)*hand_length nohead lw 7 lc rgb 'blue'
p NaN

set polar
unset trange
unset raxis
unset rtics

unset multiplot
unset output
