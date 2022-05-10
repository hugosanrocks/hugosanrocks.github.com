#num=40
#for i in $(seq 0 $num); do
# mv $(printf "jumping.%04i.png jumping_%04i.png" $i $i)
#done
num=4
for i in $(seq 0 $num); do
 convert -negate $(printf "jumping_%04i.png jumping_neg_%04i.png" $i $i)
done

