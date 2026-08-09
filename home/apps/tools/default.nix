{pkgs, ...}: {
  imports = [
    ./motrix-next.nix
  ];

  home.packages = with pkgs; [
    imagemagick
    fastfetch
    playerctl
  ];
}
