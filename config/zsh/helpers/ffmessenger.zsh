ffmessenger() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: messenger_convert <input_video> <output_video.mp4>"
    return 1
  fi

  ffmpeg -y -i "$1" \
    -map 0:v:0 -map "0:a?" \
    -map_metadata -1 -map_chapters -1 \
    -c:v libx264 -profile:v baseline -level 3.1 -pix_fmt yuv420p \
    -vf "scale='min(1280,iw)':-2,format=yuv420p" \
    -r 30 -fps_mode cfr -vsync cfr -crf 24 -preset veryfast \
    -c:a aac -b:a 128k -ar 44100 -ac 2 \
    -movflags +faststart \
    "$2"
}

