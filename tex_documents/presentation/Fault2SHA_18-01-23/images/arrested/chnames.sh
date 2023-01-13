#num=40
#for i in $(seq 0 $num); do
# mv $(printf "arrested.%04i.png arrested_%04i.png" $i $i)
#done

#num=40
#for i in $(seq 0 $num); do
# mv $(printf "arrested_few.%04i.png arrested_few_%04i.png" $i $i)
#done

num=9
for i in $(seq 0 $num); do
 convert -negate $(printf "arrested_%04i.png arrested_neg_%04i.png" $i $i)
done
