{

  virtualisation.oci-containers.backend = "podman";

  virtualisation.podman.enable = true;

  # work around issue where podman user services are heavily delayed waiting for network-online
  # (see https://github.com/containers/podman/issues/24796) by creating a dummy unit that forces
  # the target to be activated
  systemd.services."dummy-network-online" = {
    description = "Dummy service to activate network-online.target";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    script = "echo true";
    wantedBy = [ "multi-user.target" ];
  };

  virtualisation.podman.autoPrune = {
    enable = true;
    dates = "weekly";
  };

}

