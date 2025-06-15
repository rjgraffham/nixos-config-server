{ sources, ... }:

{
  services.nginx.simpleVhosts."msjessi.ca" = {
    vhostType = "static";
    webroot = "${sources.sites}/www.msjessi.ca/html";
    aliases = [ "www.msjessi.ca" ];
  };
}

