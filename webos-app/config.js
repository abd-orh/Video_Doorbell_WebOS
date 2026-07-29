/* Video Doorbell for LG webOS */
const CONFIG = {
    // /config/www/reolink/ is exposed by Home Assistant as /local/reolink/
    BASE_URL: "http://192.168.1.78:8123/local/reolink/",
    // Delay between displayed snapshots, in milliseconds
    REFRESH_INTERVAL: 250,
    // Overlay visibility time, in milliseconds
    DISPLAY_TIME: 10000,
    // Number of sequential JPEG frames generated per event
    MAX_FRAMES: 40
};
