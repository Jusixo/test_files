#! /bin/bash -x

VBR="2500k"
FPS="30"
QUAL="medium"
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"
YOUTUBE_KEY="7dw5-jsa4-tap6-5uf0"
# YOUTUBE_KEY="j73c-7dwz-waq8-8v7u"

SOURCE="tcp://192.168.1.1:5555"
# SOURCE="video.mp4"
# SOURCE="ed_1024.mp4"

# ffmpeg -i ${SOURCE} -c:v copy -c:a copy -an -f flv rtmp://live-iad.twitch.tv/app/live_157224777_aotUAwec4DHQKA2cUGX0a2N5JFjiq5
# rtsp://foo.flv:554/ch00.h264

ffmpeg \
    -i "$SOURCE" \
    -f lavfi -i anullsrc=r=48000:cl=mono \
    -vf fps=1/60 img%03d.jpg \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -coder 0 -profile:v baseline -refs 1 -x264opts b-pyramid=0 -r 24 -acodec aac \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$YOUTUBE_KEY"
