{ config, pkgs, lib, ... }:
let 

  cfg = config.services.syncthing;

in

{
  # Mount hetzner volume as backing for syncthing's data dir
  fileSystems.${cfg.dataDir} = {
    device = "/dev/disk/by-label/volume-hel1-1";
    fsType = "btrfs";
    options = [
      "discard"  # from hetzner's own instructions for mounting volumes, TRIMming is desirable
      "defaults"
      "subvol=@syncthing"
    ];
  };

  # Add regular user to syncthing's group
  users.users.rj.extraGroups = [ cfg.group ];
  # Ensure permissions are correct on the data dirs for group access
  systemd.services.syncthing.serviceConfig.UMask = "0007";
  systemd.tmpfiles.rules = [
    "d ${cfg.dataDir} 0750 ${cfg.user} ${cfg.group}"          # ensure base dir exists and is u=rwx,g=rw
    "z ${cfg.dataDir}/*/ 2770 ${cfg.user} ${cfg.group}"       # set all topdirs to u=rwx,g=rws
    "Z ${cfg.dataDir}/*/* 0770 ${cfg.user} ${cfg.group}"      # set files in topdirs to u=rwx,g=rwx (recursive)
    "Z ${cfg.dataDir}/.config 0700 ${cfg.user} ${cfg.group}"  # ...except .config, which is u=rwx only (recursive)
  ];

  # Configure syncthing itself
  services.syncthing = {
    enable = true;
    overrideFolders = false;      # allow to configure folders imperatively via web GUI
    openDefaultPorts = true;      # opens only the syncing and discovery ports, NOT the web gui port
    guiAddress = "0.0.0.0:8384";  # listen on all interfaces (should be safe as port is not opened)
  };
}

