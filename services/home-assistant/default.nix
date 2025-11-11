{

  virtualisation.oci-containers.backend = "podman";

  virtualisation.oci-containers.containers.homeassistant = {

    volumes = [
      "home-assistant:/config"
      "/var/run/dbus:/run/dbus:ro"
    ];

    environment.TZ = "Europe/London";

    image = "ghcr.io/home-assistant/home-assistant:stable";
    pull = "newer";

    extraOptions = [
      "--network=host"
    ];

  };

  networking.firewall.allowedTCPPorts = [ 8123 ];

  services.music-assistant = {
    enable = true;
    providers = [
      "builtin"
      "builtin_player"
      "chromecast"
      "filesystem_local"
      "filesystem_smb"
      "gpodder"
      "itunes_podcasts"
      "musicbrainz"
      "player_group"
      "podcastfeed"
      "soundcloud"
      "spotify"
      "spotify_connect"
      "tunein"
    ];
  };

}

