set terminal png nocrop enhanced size 640,480 font "arial,12" 
set output 'gradient_dial.png'
set multiplot
set xrange [-1:1]
set yrange [0:1]
set zrange [-pi:pi]
set view map scale 1
set size ratio -1
unset colorbox
unset border
unset xtics
unset ytics
unset label
set samples 5000, 5000
set isosamples 1000, 1000
set pm3d map
set pm3d interpolate 1,1 flush begin noftriangles noborder corners2color mean
set palette positive nops_allcF maxcolors 0 gamma 1.5 color  model RGB defined (0 "red", pi/4. "red", pi/2. - 0.2 "yellow", pi/2. "green", pi/2. + 0.4  "yellow", 3.*pi/4. "red", pi "red")
hand_length = 0.7
innerradius = 0.4
outerradius = 1.0
mark_start_radius = 0.8
mark_end_radius = 1.0
mark_division = 10.

hand_angle(time, max_hand_value) = -pi*time/max_hand_value + pi
hand_angle_value = hand_angle(value, max_value)
splot [-1:1] [0:1] (x*x+y*y> innerradius?(x*x+y*y < outerradius?atan(x/y):1/0):1/0) notitle palette
do for [t=0:int(max_value):int(max_value/mark_division)] {
    mark_angle = hand_angle(t, max_value)
    set arrow from cos(mark_angle)*mark_start_radius, sin(mark_angle)*mark_start_radius to cos(mark_angle)*mark_end_radius, sin(mark_angle)*mark_end_radius nohead lw 6 lc rgb 'black'
}

set arrow from 0,0 to cos(hand_angle_value)*hand_length,sin(hand_angle_value)*hand_length nohead lw 7 lc rgb 'blue'
sp NaN notitle
unset multiplot
