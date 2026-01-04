{

  virtualisation.oci-containers.backend = "podman";

  virtualisation.podman.autoPrune = {
    enable = true;
    dates = "weekly";
  };

}

