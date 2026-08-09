{pkgs, ...}: {
  home.packages = with pkgs; [
    localsend
    telegram-desktop
    vesktop
  ];
}