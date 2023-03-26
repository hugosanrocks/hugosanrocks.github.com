num=2205
ini=6
delta=5
fin=146
for j in $(seq $ini $delta $fin)
do
  lines=$(printf "lines_%05i.dat" $j)
  cp empty.dat $lines
  for f in *receive*.dat; do
    cp $lines lines2.txt
    echo $f
    name=$(printf "%s_head" $f)
    head $f --lines=$j > $name
    tail $name --lines=1 > line
    cat line lines2.txt > $lines
  done
  rm line lines2.txt
done
