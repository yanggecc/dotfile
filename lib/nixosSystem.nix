{
  self,
  inputs,
  lib,
  system,
  nixos-modules,
  myvars,
  mylib,
  ...
}: let
  inherit (inputs) nixpkgs;
in
  nixpkgs.lib.nixosSystem {
    inherit system;
    modules = nixos-modules;
    specialArgs = {
      inherit myvars mylib inputs self;
    };
  }
