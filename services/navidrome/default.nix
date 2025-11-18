{ config, ... }:

{

  services.navidrome = {

    enable = true;

    settings = {
      Address = "127.0.0.1";
      Port = 4533;
      MusicFolder = "/var/lib/syncthing/Music";
    };

    openFirewall = true;

    # since we're using a music folder from under syncthing's folder,
    # we place both services under the same group to allow access
    group = config.services.syncthing.group;

  };

  services.nginx.simpleVhosts."music.psquid.net" = {
    vhostType = "proxy";
    port = config.services.navidrome.settings.Port;
  };

}

