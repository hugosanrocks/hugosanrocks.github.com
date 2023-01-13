num=100
for i in $(seq 0 $num); do
 mv $(printf "sliprate_d.%04i.png SRd_%04i.png" $i $i)
done
num=100
for i in $(seq 0 $num); do
 convert -negate $(printf "SRd_%04i.png SRd_neg_%04i.png" $i $i)
done

