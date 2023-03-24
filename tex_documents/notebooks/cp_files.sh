
ni=1
delta=1
fin=2200
i=1
for j in $(seq $ini $delta $fin)
do
  file1=$(printf "offm2p5_gapp5p0-receiver-%05i-00000.dat" $j)
  file2=$(printf "../output_h_plus/offm2p5_gapp5p0-receiver-%05i-00000.dat" $i)
  mv $file1 $file2
  i=$((i+1))
done


ini=2201
delta=1
fin=3130
i=1
for j in $(seq $ini $delta $fin)
do
  file1=$(printf "offm2p5_gapp5p0-receiver-%05i-00000.dat" $j)
  file2=$(printf "../output_v_plus/offm2p5_gapp5p0-receiver-%05i-00000.dat" $i)
  mv $file1 $file2
  i=$((i+1))
done

ini=3131
delta=1
fin=4060
i=1
for j in $(seq $ini $delta $fin)
do
  file1=$(printf "offm2p5_gapp5p0-receiver-%05i-00000.dat" $j)
  file2=$(printf "../output_v_plus_vet/offm2p5_gapp5p0-receiver-%05i-00000.dat" $i)
  mv $file1 $file2
  i=$((i+1))
done

