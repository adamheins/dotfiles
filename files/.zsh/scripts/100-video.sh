# Convert video to GIF using FFMPEG
v2gif() {
  if [ -z "$1" ]; then
    return
  fi
  local root="${1%.*}"
  ffmpeg -i "$1" -loglevel warning -r 15 "$root".gif
}
