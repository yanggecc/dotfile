{pkgs, ...}: {
  home.packages = with pkgs; [
    imagemagick
    fastfetch
    playerctl
  ];
}