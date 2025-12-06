{ config, ... }:

{

  services.pinchflat = {

    enable = true;

    mediaDir = "/var/lib/pinchflat/media";

    extraConfig.EXPOSE_FEED_ENDPOINTS = "true";

    openFirewall = true;

    secretsFile = config.age.secrets.pinchflat.path;

  };

  age.secrets.pinchflat.file = ../../secrets/pinchflat.age;

  services.nginx.simpleVhosts."pinch.psquid.net" = {
    vhostType = "proxy";
    port = config.services.pinchflat.port;
  };

}

