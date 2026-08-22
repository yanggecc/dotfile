{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./niri
    ./noctalia
    ./anyrun.nix
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

  # GTK 全局深色主题
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # GNOME / libadwaita 应用深色主题
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Adwaita-dark";
        icon-theme = "Adwaita";
      };
    };
  };

  home.file."Pictures/Screenshots/.keep".text = "";
}
