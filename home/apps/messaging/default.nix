{pkgs, ...}: {
  imports = [
    ./kdeconnect.nix
  ];

  home.packages = with pkgs; [
    localsend
    telegram-desktop
    vesktop
  ];
}
