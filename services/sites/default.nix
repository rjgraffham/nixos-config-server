{ sources, ... }:

{

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  security.acme.acceptTerms = true;
  security.acme.defaults.email = "letsencrypt@psquid.net";

  services.nginx = {
    enable = true;
    recommendedOptimisation = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;

    # default catch-all sites are deferred to containerized nginx
    # two separate blocks are required as the proxied ports are different
    virtualHosts."_" = {
      locations."/" = {
        proxyPass = "http://localhost:9980";
      };
    };
    virtualHosts."_ssl" = {
      onlySSL = true;
      sslCertificateKey = "${sources.sites}/snakeoil-2021.key";
      sslCertificate = "${sources.sites}/snakeoil-2021.crt";
      serverName = "_";
      default = true;
      locations."/" = {
        proxyPass = "http://localhost:9943";
      };
    };
  };

  # Import site configurations, mostly using modules/simple-nginx for terse SSL-by-default sites.
  imports = [
    ./psquid.net.nix
    ./gaydog.mom.nix
    ./msjessi.ca.nix
  ];
    
}
