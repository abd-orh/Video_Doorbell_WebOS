#!/bin/sh
# Downloads sequential JPEG snapshots from go2rtc.
DIR="/config/www/reolink"
MAX_FRAMES=40
mkdir -p "$DIR"

# Remove frames from the previous event.
rm -f "$DIR"/frame*.jpg "$DIR"/frame*.tmp

i=1
while [ "$i" -le "$MAX_FRAMES" ]
do
    # Convert the frame counter to four digits.
    NUMBER=$(printf "%04d" "$i")
    TEMP="$DIR/frame${NUMBER}.tmp"
    FINAL="$DIR/frame${NUMBER}.jpg"

    # Replace the placeholders with your own go2rtc values.
    # Download to a temporary file to avoid publishing incomplete JPEG files.
    curl -s -u YOUR_GO2RTC_USERNAME:YOUR_GO2RTC_PASSWORD \
        "http://YOUR_HOME_ASSISTANT_IP:1984/api/frame.jpeg?src=Reolink" \
        -o "$TEMP"

    if [ -s "$TEMP" ]; then
        mv -f "$TEMP" "$FINAL"
    else
        rm -f "$TEMP"
    fi

    i=$((i + 1))
    sleep 0.25

done
rm -f "$DIR"/frame*.tmp
