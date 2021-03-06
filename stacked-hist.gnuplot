#!/usr/bin/gnuplot

set term postscript eps enhanced color
set output 'stacked-hist.eps'


set title "LUBM TransE Tail Predictions Unfiltered"
# If we don't use columnhead, the first line of the data file
# will confuse gnuplot, which will leave gaps in the plot.
set key top left outside horizontal autotitle columnhead

#set xtics rotate by 90 offset 0,-5 out nomirror
set autoscale x
set ytics out nomirror

#set xrange[0:5000]

set style fill solid border -1
# Make the histogram boxes half the width of their slots.
set boxwidth 0.5 relative

# Select histogram mode.
set style data histograms
# Select a row-stacked histogram.
set style histogram rowstacked

set xlabel "Degree of node"

plot 'tpu.txt-hist.dat' using 2, '' using 3:xtic(1)
