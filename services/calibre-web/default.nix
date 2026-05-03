{ config, pkgs, ... }:

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

}
