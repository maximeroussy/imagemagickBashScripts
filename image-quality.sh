#!/bin/bash
echo "Beginning image quality reduction...";

for image in *.jpg
do
    image_width=$(identify -ping -format %w ${image})
    image_height=$(identify -ping -format %h ${image})
    filename="${image%.*}"
    if [[ ${image} != *"header"* ]] && [[ ${image} != *"pinterest"* ]] && [[ ${image} != *"thumbnail"* ]] && [[ ${image} != *"twitter_facebook"* ]]; then
        if [ ${image_width} -gt 2000 ]; then
            convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 80% -resize 2000x ${filename}".jpg"
        else
            convert ${image} -strip -interlace Plane -gaussian-blur 0.05 -quality 80% -resize 100% ${filename}".jpg"
        fi
    fi
done

echo "Done!";