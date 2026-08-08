{
  self,
  lib,
  mylib,
  myvars,
  inputs,
  pkgs,
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

  # 提供 home-manager CLI 命令
  environment.systemPackages = [
    inputs.home-manager.packages.${pkgs.system}.default
  ];

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
