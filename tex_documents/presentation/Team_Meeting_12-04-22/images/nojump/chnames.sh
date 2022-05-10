num=40
#for i in $(seq 0 $num); do
# mv $(printf "nojump.%04i.png nojump_%04i.png" $i $i)
#done
num=9
for i in $(seq 0 $num); do
 convert -negate $(printf "nojump_%04i.png nojump_neg_%04i.png" $i $i)
done

