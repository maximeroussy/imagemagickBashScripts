#!/bin/bash
echo "Beginning srcset creation...";

for image in *.{jpg,JPG}
do
    image_width=$(identify -ping -format %w ${image})
    image_height=$(identify -ping -format %h ${image})
    filename="${image%.*}"
    if [ ${image_width} -gt 600 ]; then
    convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 600x ${filename}"_600w.jpg"
    fi
    if [ ${image_width} -gt 1000 ]; then
    convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 1000x ${filename}"_1000w.jpg"
    fi
    if [ ${image_width} -gt 1200 ]; then
    convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 1200x ${filename}"_1200w.jpg"
    fi
    if [ ${image_width} -gt 2000 ]; then
    convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 2000x ${filename}"_2000w.jpg"
    fi
    if [ ${image_width} -gt 2600 ]; then
    convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 2600x ${filename}"_2600w.jpg"
    fi
    if [ ${image_width} -gt 4000 ]; then
    convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 4000x ${filename}"_4000w.jpg"
    fi
    convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 100% ${filename}"_"${image_width}"w.jpg"

done

echo "Done! srcset created.";