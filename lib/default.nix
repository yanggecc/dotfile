{
  lib,
  builtins,
  ...
}:
with lib; let
  removeSuffix = suffix: str:
    if lib.strings.hasSuffix suffix str
    then lib.strings.substring 0 (builtins.stringLength str - builtins.stringLength suffix) str
    else str;

  extractName = path: let
    parts = lib.splitString "/" path;
    lastPart = lib.last parts;
  in
    lib.replaceStrings [".nix"] [""] lastPart;
in {
  removeSuffix = removeSuffix;
  extractName = extractName;

  nixosSystem = import ./nixosSystem.nix;
  file = import ./file.nix {inherit lib builtins;};
}
