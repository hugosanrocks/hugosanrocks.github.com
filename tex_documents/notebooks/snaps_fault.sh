ini=1
delta=1
fin=2940
ntail=101

for j in $(seq $ini $delta $fin)
do
  str2=$(printf "offm2p5_gapp5p0-faultreceivernew-%05i-00000.dat" $j)
  str1=$(printf "offm2p5_gapp5p0-faultreceiver-%05i-00000.dat" $j)
  tail $str1 --lines=$ntail > $str2
done

for j in $(seq $ini $delta $fin)
do
 lines=$(printf "offm2p5_gapp5p0-faultreceivernew-%05i-00000.dat" $j)
 lines_c=$(printf "offm2p5_gapp5p0-faultreceivercorr-%05i-00000.dat" $j)
 awk '{ print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " " $15 " " $16 " " $17 " " $18 " " $19 " " $20  }' $lines > $lines_c
 mv $lines_c $lines
done

