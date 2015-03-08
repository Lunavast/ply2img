#!/bin/sh
for i in *.cpp; do
    if [ -f "$i~" ]; then
        di=$(diff $i "$i~")
    else
        di=" "
    fi
    if [ "$di" != "" ]; then
        echo "compiling $i"
	gcc -I/usr/local/include/opencv /usr/local/lib/libopencv_calib3d.dylib /usr/local/lib/libopencv_contrib.dylib /usr/local/lib/libopencv_core.dylib /usr/local/lib/libopencv_features2d.dylib /usr/local/lib/libopencv_flann.dylib /usr/local/lib/libopencv_gpu.dylib /usr/local/lib/libopencv_imgproc.dylib /usr/local/lib/libopencv_highgui.dylib /usr/local/lib/libopencv_legacy.dylib /usr/local/lib/libopencv_ml.dylib /usr/local/lib/libopencv_nonfree.dylib /usr/local/lib/libopencv_objdetect.dylib /usr/local/lib/libopencv_ocl.dylib /usr/local/lib/libopencv_photo.dylib /usr/local/lib/libopencv_stitching.dylib /usr/local/lib/libopencv_superres.dylib /usr/local/lib/libopencv_ts.dylib /usr/local/lib/libopencv_video.dylib /usr/local/lib/libopencv_videostab.dylib /usr/local/lib/libply.dylib -lstdc++ -c++11 -o `basename $i .cpp` $i
    fi
    cp $i "$i~"
done
