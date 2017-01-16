#!/bin/bash
echo "Beginning header resizing...";

for image in *.jpg
do
    image_width=$(identify -ping -format %w ${image})
    image_height=$(identify -ping -format %h ${image})
    filename="${image%.*}"
    if [[ ${image} == *"header"* ]]; then
        if [ ${image_width} -gt 1000 ]; then
        convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 80% -resize 1000x ${filename}"_1000w.jpg"
        fi
        if [ ${image_width} -gt 2000 ]; then
        convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 80% -resize 2000x ${filename}"_2000w.jpg"
        fi
        if [ ${image_width} -gt 3000 ]; then
        convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 80% -resize 3000x ${filename}"_3000w.jpg"
        fi
        if [ ${image_width} -gt 4000 ]; then
        convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 80% -resize 4000x ${filename}"_4000w.jpg"
        fi
        convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 80% -resize 100% ${filename}".jpg"
    fi
done

echo "Done!";