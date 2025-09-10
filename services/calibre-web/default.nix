{ config, pkgs, lib, ... }:

{

  services.calibre-web = {

    enable = true;

    listen.ip = "0.0.0.0";
    listen.port = 8083;
    openFirewall = true;

    dataDir = "/var/lib/calibre-web";

    options = {

      calibreLibrary = "${config.services.calibre-web.dataDir}/library";

      enableBookUploading = true;

    };

    package = pkgs.calibre-web.overridePythonAttrs (super: {
      dependencies = super.dependencies ++ super.optional-dependencies.kobo;
    });

  };

  # Workaround for incorrect service definition, pending upstream fix in PR 441487
  systemd.services.calibre-web.serviceConfig.environment = lib.mkForce "";
  systemd.services.calibre-web.environment.CACHE_DIR = "/var/cache/calibre-web";

  services.nginx.simpleVhosts."calibre.psquid.net" = {
    vhostType = "proxy";
    port = config.services.calibre-web.listen.port;
  };

  services.nginx.virtualHosts."calibre.psquid.net".extraConfig = ''
    proxy_max_temp_file_size 256M;
    client_max_body_size 256M;
  '';

}
