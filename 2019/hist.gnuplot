#!/usr/bin/gnuplot

set term postscript eps enhanced color font ",30"

datafile = ARG1
outfile = system('echo '.datafile.' | cut -d. -f1')
outfile = outfile.'.eps'
set output outfile
firstrow = system('head -1 '.datafile)

#set title ARG1
#set key top left outside horizontal title "Accuracy" font ", 30"
#set key top left outside horizontal title "Accuracy" font ", 25"
set nokey
#set auto x
#set xtics scale 3,2 rotate by 67 out nomirror
#set xtics out offset 0,-3.0
set xtics offset 0.6, graph 0.02 font ", 25"
set ytics font ", 25"
set yrange[0:100]
#set xtics 0,50,500 out nomirror
#set autoscale x
#show xtics
set ytics out nomirror
set grid ytics lt 2

set style fill solid border -1
set boxwidth 1.2 relative
set style data histograms
set style histogram
#set xlabel word(firstrow, 1) offset 40,1.8 font ", 30"
set xlabel word(firstrow, 3) offset 0,-0.5 font ", 25"
#set xlabel "Query Type" offset 0,-0.5 font ", 30"

# To set numbers on the top of graph
set ylabel "% Accuracy" offset 2,0.2 font ", 25"

# working command
#plot ARG1 using 2 :xtic(1), '' using 0:2:2 with labels offset 0.65,0.6 font ", 30" notitle

#plot ARG1 using 4 :xtic(3)  notitle

plot ARG1 using 4 :xtic(3) lc rgb "black" ,  '' using 0:4:4 with labels offset 0.65,0.4 font ",25" notitle
