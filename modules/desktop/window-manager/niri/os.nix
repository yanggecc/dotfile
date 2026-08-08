{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.desktop.wm.niri.system;
in {
  options.modules.desktop.wm.niri.system.enable = mkEnableOption "Niri (Wayland) system support";

  config = mkIf cfg.enable {
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
      config.common.default = ["gnome"];
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
