num=100
for i in $(seq 0 $num); do
 mv $(printf "italy_animation.%04i.png Sld_%04i.png" $i $i)
done
num=100
for i in $(seq 0 $num); do
 convert -negate $(printf "Sld_%04i.png Sld_neg_%04i.png" $i $i)
done

