{ config, pkgs, lib, ... }:
{
  services.cage = {
    enable = true;
    user = "rj";
    program = "${pkgs.emulationstation}/bin/emulationstation";
  };
}
