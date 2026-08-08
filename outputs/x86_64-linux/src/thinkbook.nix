{
  lib,
  mylib,
  inputs,
  system,
  ...
} @ args: let
  name = "thinkbook";
  nixos-modules = map mylib.file.relativeToRoot [
    "hosts/${name}"
  ];
in {
  nixosConfigurations = {
    "${name}" = mylib.nixosSystem (args // {inherit nixos-modules;});
  };
}
