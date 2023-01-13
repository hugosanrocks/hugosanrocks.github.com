num=100
for i in $(seq 0 $num); do
 convert $(printf "SRd_neg_%04i.png -quality 0 SRd_neg_%04i.jp2" $i $i)
 img2pdf -o $(printf "SRd_neg_%04i.pdf SRd_neg_%04i.jp2" $i $i)
 pdfcrop --margins '-460 -25 0 0' $(printf "SRd_neg_%04i.pdf" $i)
 mv $(printf "SRd_neg_%04i-crop.pdf SRd_neg_%04i.pdf" $i $i)
done
