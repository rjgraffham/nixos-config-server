{ pkgs, lib, sources, ... }:

{
  services.nginx.simpleVhosts = {
    "dl.psquid.net" = {
      vhostType = "static";
      webroot = "${sources.sites}/dl.psquid.net/html";
    };

    "dl-public.psquid.net" = {
      vhostType = "index";
      webroot = "${sources.sites}/dl-public.psquid.net/html";
    };

    "psquid.net" = let
      blog = pkgs.stdenv.mkDerivation {
        name = "blog";
        src = sources.blog.outPath;

        buildPhase = ''
          mkdir -p ./built ./src
          cp -r $src/* ./src/

          ${lib.getExe pkgs.jekyll} build -s ./src -d ./built

          mkdir -p $out
          cp -r ./built/* $out/
        '';
      };
    in {
      vhostType = "static";
      webroot = "${blog}";
      aliases = [ "www.psquid.net" ];
    };
  };
  
  services.nginx.virtualHosts."dl.psquid.net".extraConfig = let

    uikit = pkgs.stdenv.mkDerivation {
      name = "uikit";
      src = sources.uikit.outPath;

      buildPhase = ''
        mkdir -p $out
        cp -r $src/dist/* $out/
      '';
    };

  in ''
    location ~* \.(eot|ttf|woff|woff2)$ {
      root ${sources.sites}/dl.psquid.net/html;
      add_header Access-Control-Allow-Origin *;
    }

    location /uikit/ {
      alias ${uikit}/;
      add_header Access-Control-Allow-Origin *;
    }
  '';
}
