{
  self,
  lib,
  mylib,
  myvars,
  inputs,
  ...
}: let
  hostName = "thinkbook";
in {
  imports =
    [
      ./hardware-configuration.nix
      ../../system
    ]
    ++ (mylib.file.scanPaths ../../modules "os.nix")
    ++ [inputs.home-manager.nixosModules.home-manager];

  networking.hostName = hostName;

  modules.desktop.wm.niri.system.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${myvars.username}.imports = [../../home];
    extraSpecialArgs = {
      inherit myvars inputs self;
    };
  };

  system.stateVersion = "26.05";
}
