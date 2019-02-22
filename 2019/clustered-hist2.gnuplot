#!/usr/bin/gnuplot

set term postscript eps enhanced color font ",30"

datafile = ARG1
outfile = system('echo '.datafile.' | cut -d. -f1')
outfile = outfile.'.eps'
set output outfile
firstrow = system('head -1 '.datafile)

#set title "Model wise percent decrease"
set key outside left top horizontal autotitle columnhead font ", 25"
#set nokey
set auto x
set xtics offset 0.6, graph 0.02 font ", 25" rotate by 25 right
set ytics font ", 25"
set yrange[0:100]
set ytics out nomirror

set grid ytics lt 2

set style data histograms
set style histogram cluster gap 1
set style fill pattern border -1
set boxwidth 1.0

#set xlabel word(firstrow, 1) offset 0,0.5 font ", 30"
set ylabel "% Decrease" offset 2,0.2 font ", 25"

plot ARG1 using 2 :xtic(1)  title col, \
    '' using 3:xtic(1) title col lc rgb "black", \
    '' using 4:xtic(1) title col lc rgb "black", \
    '' using 5:xtic(1) title col lc rgb "black", \
    '' using 6:xtic(1) title col lc rgb "black"
