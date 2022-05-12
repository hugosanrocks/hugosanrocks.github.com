num=100
for i in $(seq 0 $num); do
 convert $(printf "Sld_neg_%04i.png -quality 0 Sld_neg_%04i.jp2" $i $i)
 img2pdf -o $(printf "Sld_neg_%04i.pdf Sld_neg_%04i.jp2" $i $i)
 pdfcrop --margins '-460 -25 0 0' $(printf "Sld_neg_%04i.pdf" $i)
 mv $(printf "Sld_neg_%04i-crop.pdf Sld_neg_%04i.pdf" $i $i)
done
