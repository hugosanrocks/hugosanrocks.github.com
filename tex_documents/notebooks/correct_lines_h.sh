num=2205
ini=6
delta=2
fin=204
for j in $(seq $ini $delta $fin)
do
 lines=$(printf "lines_%05i.dat" $j)
 lines_c=$(printf "lines_%05i.dat_c" $j)
 awk '{ print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " " $9 " " $10  }' $lines > $lines_c
 mv $lines_c $lines
done
