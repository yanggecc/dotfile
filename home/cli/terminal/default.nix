{...}: {
  imports = [
    ./emulators/ghostty.nix
    ./emulators/kitty.nix
    ./shell/fish.nix
    ./shell/bash.nix
    ./software
  ];
}
