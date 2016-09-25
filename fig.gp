reset
NAME="write_120_256_512"

set terminal postscript eps color enhanced size 5,2 font "Times-Roman" 22
set output NAME."_lat.eps"
set border 3 back
set tics nomirror out scale 0.75
set xlabel "Time (m)"
set xrange [0:1400]
set xtics 200
set ylabel "Latency (ms)"
set yrange [0:600]
set ytics 200
p NAME."_lat.1.log" u ($1/1000):($2/1000) notitle pt 0 ps 2 

set output NAME."_bw.eps"
set ylabel "Throughput (MB/s)"
set yrange [0:200]
set ytics 50
p NAME."_bw.1.log" u ($1/1000):($2/1000) notitle pt 0 ps 2 
