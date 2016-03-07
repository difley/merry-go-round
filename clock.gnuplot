hour_hand_length = 0.5
minute_hand_length = 0.9
second_hand_length = 0.9
mark_start_radius = 0.8
mark_end_radius = 1.0
hour_division = 12.
minute_division = 60.
second_division = 60.

hand_angle(time, division) = -2.*pi*time/division + pi/2.
adjusted_hour = hour + minute/minute_division
adjusted_minute = minute + second/second_division
second_angle = hand_angle(second, second_division)
minute_angle = hand_angle(adjusted_minute, minute_division)
hour_angle = hand_angle(adjusted_hour, hour_division)

set term svg
set output "clock.svg"
set size square
set multiplot
unset key
unset border
unset ytics
unset xtics
set xrange [-1:1]
set yrange [-1:1]
do for [t=0:int(hour_division)] {
    set arrow from cos(hand_angle(t, hour_division))*mark_start_radius, sin(hand_angle(t, hour_division))*mark_start_radius to cos(hand_angle(t, hour_division))*mark_end_radius, sin(hand_angle(t, hour_division))*mark_end_radius nohead lw 6 lt 8
}

set arrow from 0,0 to cos(hour_angle)*hour_hand_length,sin(hour_angle)*hour_hand_length nohead lw 7 lt 4
set arrow from 0,0 to cos(minute_angle)*minute_hand_length,sin(minute_angle)*minute_hand_length nohead lw 5 lt 6
set arrow from 0,0 to cos(second_angle)*second_hand_length,sin(second_angle)*second_hand_length nohead lw 3 lt 7
p NaN

set polar
unset raxis
unset rtics
p 1 lw 6
p 0.05 w filledcu lt 7, 0.01 lt 7

unset multiplot
unset output
