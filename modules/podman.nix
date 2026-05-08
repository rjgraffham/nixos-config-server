{

  virtualisation.oci-containers.backend = "podman";

  virtualisation.podman.enable = true;

  virtualisation.podman.autoPrune = {
    enable = true;
    dates = "weekly";
  };

}

