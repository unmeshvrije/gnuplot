gnuplot -c clustered-hist.gnuplot clustered-hist.dat
gnuplot -c clustered-hist2.gnuplot clustered-hist2.dat
gnuplot -c clustered-hist3.gnuplot clustered-hist3.dat
gnuplot -c clustered-hist4.gnuplot clustered-hist4.dat
ls *.eps | while read file;
do epstopdf $file;
done
rm *.eps
