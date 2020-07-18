#-density 300 sets the dpi that the PDF is rendered at.
#-trim removes any edge pixels that are the same color as the corner pixels.
#-quality 100 sets the JPEG compression quality to the highest quality.
convert -density 300 -trim input/pdf/*pdf -quality 100 sandbox/output.jpg

# Image Deskew using deskew.py
cd engine/Alyn/alyn
python ./deskew.py -i ../../../sandbox/output.jpg -o ../../../sandbox/rotated.jpg

# Page dewarping and thresholding using a "cubic sheet" model
cd ../../page_dewarp
python page_dewarp.py ../../sandbox/rotated.jpg

cd ../
./textcleaner ../sandbox/rotated.jpg ../output/final.jpg