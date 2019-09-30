#!/usr/bin/gnuplot
reset
set term postscript eps enhanced color font ",10"

outfile = 'all-recalls.eps'
set output outfile

MARGINTB_TOP   = "set tmargin at screen 0.95; set bmargin at screen 0.65"
MARGINTB_MID   = "set tmargin at screen 0.65; set bmargin at screen 0.35"
MARGINTB_BOT   = "set tmargin at screen 0.35; set bmargin at screen 0.05"
MARGINLR_LEFT  = "set lmargin at screen 0.05; set rmargin at screen 0.35"
MARGINLR_MID   = "set lmargin at screen 0.35; set rmargin at screen 0.65"
MARGINLR_RIGHT = "set lmargin at screen 0.65; set rmargin at screen 0.95"
TOPKOFF        = "offset 0,-0.3"

KEYOFF = "offset 0.5,0 top left inside"

FB_TRANSE  = "\"fb15k237_transe_minSub-10_nSubgs-8894-recall.dat\""
FB_HOLE    = "\"fb15k237_hole_minSub-10_nSubgs-8894-recall.dat\""
FB_DISTMUL = "\"fb15k237_distmul_minSub-10_nSubgs-8894-recall.dat\""

YAGO_TRANSE = "\"yago2_transe_minSub-10_nSubgs-9968-recall.dat\""
YAGO_HOLE   = "\"yago2_hole_minSub-10_nSubgs-9968-recall.dat\""
YAGO_DISTMUL= "\"yago2_distmul_minSub-10_nSubgs-9968-recall.dat\""

LUBM_TRANSE = "\"lubm1_transe_minSub-10_nSubgs-1218-recall.dat\""
LUBM_HOLE   = "\"lubm1_hole_minSub-10_nSubgs-1218-recall.dat\""
LUBM_DISTMUL= "\"lubm1_distmul_minSub-10_nSubgs-1218-recall.dat\""

COLPAT1 = "lc rgb \"black\" fs pattern 4"
COLPAT2 = "lc rgb \"black\" fs pattern 2"

#print(@LUBM_TRANSE )

set multiplot layout 3,3
unset ylabel
set key off #inside horizontal top left autotitle columnhead reverse
set auto x
set yrange[0:100]

set style data histograms
set style histogram cluster gap 1 title offset 0,0.30
set style fill pattern border -1
set boxwidth 1.0
set grid ytics lt 2
#set ytics font ", 10"  out nomirror

set lmargin 10
set bmargin 6
# First row
unset xtics
unset xlabel
@MARGINLR_LEFT; @MARGINTB_TOP
set key top left outside horizontal
set label "LUBM TRANSE" at screen 0.10,0.93 center front font ", 10"
plot newhistogram "", @LUBM_TRANSE  using 2  title col @COLPAT1, '' using 3  notitle @COLPAT2, \
     newhistogram "", @LUBM_TRANSE  using 4  notitle @COLPAT1, '' using 5  notitle @COLPAT2, \
     newhistogram "", @LUBM_TRANSE  using 6  notitle @COLPAT1, '' using 7  notitle @COLPAT2, \
     newhistogram "", @LUBM_TRANSE  using 8  notitle @COLPAT1, '' using 9  notitle @COLPAT2, \
     newhistogram "", @LUBM_TRANSE  using 10 notitle @COLPAT1, '' using 11 notitle @COLPAT2, \
     newhistogram "", @LUBM_TRANSE  using 12 notitle @COLPAT1, '' using 13 notitle @COLPAT2

unset ytics

@MARGINLR_MID; @MARGINTB_TOP
set key title "YAGO TRANSE" @KEYOFF
plot newhistogram "", @YAGO_TRANSE  using 2  notitle @COLPAT1, '' using 3  notitle @COLPAT2, \
     newhistogram "", @YAGO_TRANSE  using 4  notitle @COLPAT1, '' using 5  notitle @COLPAT2, \
     newhistogram "", @YAGO_TRANSE  using 6  notitle @COLPAT1, '' using 7  notitle @COLPAT2, \
     newhistogram "", @YAGO_TRANSE  using 8  notitle @COLPAT1, '' using 9  notitle @COLPAT2, \
     newhistogram "", @YAGO_TRANSE  using 10 notitle @COLPAT1, '' using 11 notitle @COLPAT2, \
     newhistogram "", @YAGO_TRANSE  using 12 notitle @COLPAT1, '' using 13 notitle @COLPAT2

@MARGINLR_RIGHT; @MARGINTB_TOP
set key title ""
set key top right outside horizontal
set label "FB15K-237 TRANSE" at screen 0.72,0.93 center front font ", 10"
plot newhistogram "", @FB_TRANSE  using 2  notitle @COLPAT1, '' using 3  title col @COLPAT2, \
     newhistogram "", @FB_TRANSE  using 4  notitle @COLPAT1, '' using 5  notitle @COLPAT2, \
     newhistogram "", @FB_TRANSE  using 6  notitle @COLPAT1, '' using 7  notitle @COLPAT2, \
     newhistogram "", @FB_TRANSE  using 8  notitle @COLPAT1, '' using 9  notitle @COLPAT2, \
     newhistogram "", @FB_TRANSE  using 10 notitle @COLPAT1, '' using 11 notitle @COLPAT2, \
     newhistogram "", @FB_TRANSE  using 12 notitle @COLPAT1, '' using 13 notitle @COLPAT2

#second row
set ytics font ", 10"  out nomirror

@MARGINLR_LEFT; @MARGINTB_MID
set key title "LUBM HOLE" @KEYOFF
plot newhistogram "", @LUBM_HOLE  using 2  notitle @COLPAT1, '' using 3  notitle @COLPAT2, \
     newhistogram "", @LUBM_HOLE  using 4  notitle @COLPAT1, '' using 5  notitle @COLPAT2, \
     newhistogram "", @LUBM_HOLE  using 6  notitle @COLPAT1, '' using 7  notitle @COLPAT2, \
     newhistogram "", @LUBM_HOLE  using 8  notitle @COLPAT1, '' using 9  notitle @COLPAT2, \
     newhistogram "", @LUBM_HOLE  using 10 notitle @COLPAT1, '' using 11 notitle @COLPAT2, \
     newhistogram "", @LUBM_HOLE  using 12 notitle @COLPAT1, '' using 13 notitle @COLPAT2

set label "Recall" at screen 0.97, 0.5 center front rotate font ",10" #offset 0,0.2 font ", 10"

unset ytics
@MARGINLR_MID; @MARGINTB_MID
set key title "YAGO HOLE" @KEYOFF
plot newhistogram "", @YAGO_HOLE  using 2  notitle @COLPAT1, '' using 3  notitle @COLPAT2, \
     newhistogram "", @YAGO_HOLE  using 4  notitle @COLPAT1, '' using 5  notitle @COLPAT2, \
     newhistogram "", @YAGO_HOLE  using 6  notitle @COLPAT1, '' using 7  notitle @COLPAT2, \
     newhistogram "", @YAGO_HOLE  using 8  notitle @COLPAT1, '' using 9  notitle @COLPAT2, \
     newhistogram "", @YAGO_HOLE  using 10 notitle @COLPAT1, '' using 11 notitle @COLPAT2, \
     newhistogram "", @YAGO_HOLE  using 12 notitle @COLPAT1, '' using 13 notitle @COLPAT2

@MARGINLR_RIGHT; @MARGINTB_MID
set key title "FB15K-237 HOLE" @KEYOFF
plot newhistogram "", @FB_HOLE  using 2  notitle @COLPAT1, '' using 3  notitle @COLPAT2, \
     newhistogram "", @FB_HOLE  using 4  notitle @COLPAT1, '' using 5  notitle @COLPAT2, \
     newhistogram "", @FB_HOLE  using 6  notitle @COLPAT1, '' using 7  notitle @COLPAT2, \
     newhistogram "", @FB_HOLE  using 8  notitle @COLPAT1, '' using 9  notitle @COLPAT2, \
     newhistogram "", @FB_HOLE  using 10 notitle @COLPAT1, '' using 11 notitle @COLPAT2, \
     newhistogram "", @FB_HOLE  using 12 notitle @COLPAT1, '' using 13 notitle @COLPAT2


# Third row
set xtics offset 0, graph 0.02 font ", 10"# rotate by 30 right
set ytics font ", 10"  out nomirror
@MARGINLR_LEFT; @MARGINTB_BOT
set key title "LUBM DISTMUL" @KEYOFF
plot newhistogram "1" @TOPKOFF, @LUBM_DISTMUL  using 2:xtic(1)  notitle @COLPAT1, ''   using 3:xtic(1)  notitle @COLPAT2, \
     newhistogram "5" @TOPKOFF, @LUBM_DISTMUL  using 4:xtic(1)  notitle @COLPAT1, ''   using 5:xtic(1)  notitle @COLPAT2, \
     newhistogram "10" @TOPKOFF, @LUBM_DISTMUL  using 6:xtic(1)  notitle @COLPAT1, ''  using 7:xtic(1)  notitle @COLPAT2, \
     newhistogram "5%" @TOPKOFF, @LUBM_DISTMUL  using 8:xtic(1)  notitle @COLPAT1, ''  using 9:xtic(1)  notitle @COLPAT2, \
     newhistogram "10%" @TOPKOFF, @LUBM_DISTMUL  using 10:xtic(1) notitle @COLPAT1, '' using 11:xtic(1) notitle @COLPAT2, \
     newhistogram "Dyn" @TOPKOFF, @LUBM_DISTMUL  using 12:xtic(1) notitle @COLPAT1, '' using 13:xtic(1) notitle @COLPAT2

unset ytics
set label "Top K" at screen 0.5,0.97 center front font ", 10"

@MARGINLR_MID; @MARGINTB_BOT
set key title "YAGO DISTMUL" @KEYOFF
plot newhistogram "1" @TOPKOFF,   @YAGO_DISTMUL  using 2:xtic(1)  notitle @COLPAT1, '' using 3:xtic(1)  notitle @COLPAT2, \
     newhistogram "5" @TOPKOFF,   @YAGO_DISTMUL  using 4:xtic(1)  notitle @COLPAT1, '' using 5:xtic(1)  notitle @COLPAT2, \
     newhistogram "10" @TOPKOFF,  @YAGO_DISTMUL  using 6:xtic(1)  notitle @COLPAT1, '' using 7:xtic(1)  notitle @COLPAT2, \
     newhistogram "5%" @TOPKOFF,  @YAGO_DISTMUL  using 8:xtic(1)  notitle @COLPAT1, '' using 9:xtic(1)  notitle @COLPAT2, \
     newhistogram "10%" @TOPKOFF, @YAGO_DISTMUL  using 10:xtic(1) notitle @COLPAT1, '' using 11:xtic(1) notitle @COLPAT2, \
     newhistogram "Dyn" @TOPKOFF, @YAGO_DISTMUL  using 12:xtic(1) notitle @COLPAT1, '' using 13:xtic(1) notitle @COLPAT2

unset xlabel
@MARGINLR_RIGHT; @MARGINTB_BOT
set key title "FB15K-237 DISTMUL" @KEYOFF
plot newhistogram "1" @TOPKOFF,   @FB_DISTMUL  using 2:xtic(1)  notitle @COLPAT1, '' using 3:xtic(1)  notitle @COLPAT2, \
     newhistogram "5" @TOPKOFF,   @FB_DISTMUL  using 4:xtic(1)  notitle @COLPAT1, '' using 5:xtic(1)  notitle @COLPAT2, \
     newhistogram "10" @TOPKOFF,  @FB_DISTMUL  using 6:xtic(1)  notitle @COLPAT1, '' using 7:xtic(1)  notitle @COLPAT2, \
     newhistogram "5%" @TOPKOFF,  @FB_DISTMUL  using 8:xtic(1)  notitle @COLPAT1, '' using 9:xtic(1)  notitle @COLPAT2, \
     newhistogram "10%" @TOPKOFF, @FB_DISTMUL  using 10:xtic(1) notitle @COLPAT1, '' using 11:xtic(1) notitle @COLPAT2, \
     newhistogram "Dyn" @TOPKOFF, @FB_DISTMUL  using 12:xtic(1) notitle @COLPAT1, '' using 13:xtic(1) notitle @COLPAT2

unset multiplot
