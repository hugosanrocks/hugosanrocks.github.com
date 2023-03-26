for f in hori*.pdf ; do
    pdfcrop $f
    rm $f
done
