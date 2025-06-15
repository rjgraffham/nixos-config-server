{ sources, ... }:

{
  services.nginx.simpleVhosts."gaydog.mom" = {
    vhostType = "static";
    webroot = "${sources.sites}/www.gaydog.mom/html";
    aliases = [ "www.gaydog.mom" ];
  };
}
