
for f in SEISMO_TURKEY/*vert; do
 #lines=$(printf "offm2p5_gapm5p0-faultreceivernew-%05i-00000.dat" $j)
 #lines_c=$(printf "offm2p5_gapm5p0-faultreceivercorr-%05i-00000.dat" $j)
 awk '{ print $1 }' $f > $f.mod
 echo $f $f.mod
done

for f in SEISMO_TURKEY/*est; do
 #lines=$(printf "offm2p5_gapm5p0-faultreceivernew-%05i-00000.dat" $j)
 #lines_c=$(printf "offm2p5_gapm5p0-faultreceivercorr-%05i-00000.dat" $j)
 awk '{ print $1 }' $f > $f.mod
 echo $f $f.mod
done

for f in SEISMO_TURKEY/*nord; do
 #lines=$(printf "offm2p5_gapm5p0-faultreceivernew-%05i-00000.dat" $j)
 #lines_c=$(printf "offm2p5_gapm5p0-faultreceivercorr-%05i-00000.dat" $j)
 awk '{ print $1 }' $f > $f.mod
 echo $f $f.mod
done

mv SEISMO_TURKEY/ARPRnord.mod SEISMO_TURKEY/ARPRAnord.mod
mv SEISMO_TURKEY/ARPRvert.mod SEISMO_TURKEY/ARPRAvert.mod
mv SEISMO_TURKEY/ARPRest.mod SEISMO_TURKEY/ARPRAest.mod
