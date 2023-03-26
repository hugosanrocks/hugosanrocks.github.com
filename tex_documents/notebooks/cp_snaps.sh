
for f in output_h*plu* ; do
cd $f
echo $f
./snaps_h.sh
./correct_lines_h.sh
cd ..
done

for f in output_v*plu* ; do
cd $f
echo $f
./snaps_v.sh
./correct_lines_v.sh
cd ..
done
