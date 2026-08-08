{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./niri
    ./noctalia
    ./anyrun
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp
    (flameshot.override {enableWlrSupport = true;})

    # utils
    wl-clipboard
    cliphist
    brightnessctl
    playerctl
    swww

    # XWayland support
    xwayland-satellite
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  # 指针光标主题
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 20;
    gtk.enable = true;
  };

  home.file."Pictures/Screenshots/.keep".text = "";
}
