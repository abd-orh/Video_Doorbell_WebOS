# Video_Doorbel_WebOS

Display Reolink Video Doorbell snapshots as an overlay on an LG webOS TV.

This project uses sequential JPEG files because older webOS browsers may not reliably display MJPEG, FLV, or repeatedly overwritten JPEG snapshots.

## Tested setup

- LG OLED55B8SLC
- LG webOS 4.x
- Rooted webOS with SSH access
- Home Assistant OS
- go2rtc 1.9.9
- Reolink Video Doorbell WiFi

## How it works

1. A Reolink doorbell event triggers the Home Assistant automation.
2. `doorbell_snapshot.sh` downloads sequential JPEG frames from go2rtc.
3. Home Assistant launches the custom LG webOS overlay application.
4. The application displays `frame0001.jpg`, `frame0002.jpg`, and so on.
5. The overlay closes automatically after 10 seconds.

## Installation

### Home Assistant

Copy `home-assistant/doorbell_snapshot.sh` to:

```text
/config/scripts/doorbell_snapshot.sh
```

Edit the go2rtc username, password, Home Assistant IP address and stream name. Then run:

```bash
chmod +x /config/scripts/doorbell_snapshot.sh
```

Add `home-assistant/shell_command.yaml` to your Home Assistant configuration and adapt `automation.yaml` to your own entities.

### LG webOS application

Edit `webos-app/config.js` and set your Home Assistant URL:

```javascript
BASE_URL: "http://HOME_ASSISTANT_IP:8123/local/reolink/"
```

Add your own `icon.png` to `webos-app/`, package the directory as an IPK and install it on the television.

## Application information

- ID: `ro.video.doorbell`
- Version: `1.0.1`
- Vendor: `Video_Doorbell_WebOS`
- Title: `Video Doorbell`
- Window type: `overlay`

## Security

Never publish real IP addresses, passwords, device IDs or entity IDs.

## License

MIT
