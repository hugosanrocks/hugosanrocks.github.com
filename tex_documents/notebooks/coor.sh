
lines=$(printf "lines_x1.dat")
name=$(printf "temp.dat")
cp empty.dat lines_x1.dat

for f in *recei*.dat; do
    echo $f
    cp $lines lines2.txt
    head $f --lines=3 > $name
    tail $name --lines=1 > line
    cat line lines2.txt > $lines
  rm line lines2.txt
done

lines=$(printf "lines_x2.dat")
name=$(printf "temp.dat")
cp empty.dat lines_x2.dat

for f in *recei*.dat; do
    echo $f
    cp $lines lines2.txt
    head $f --lines=4 > $name
    tail $name --lines=1 > line
    cat line lines2.txt > $lines
  rm line lines2.txt
done

lines=$(printf "lines_x3.dat")
name=$(printf "temp.dat")
cp empty.dat lines_x3.dat

for f in *recei*.dat; do
    echo $f
    cp $lines lines2.txt
    head $f --lines=5 > $name
    tail $name --lines=1 > line
    cat line lines2.txt > $lines
  rm line lines2.txt
done

