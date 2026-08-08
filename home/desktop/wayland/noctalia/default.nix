{
  inputs,
  pkgs,
  self,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    package = inputs.noctalia.packages.${pkgs.system}.default;

    settings = {
      # 主题
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      # 壁纸
      wallpaper = {
        enabled = true;
        fill_mode = "crop";
        default.path = "${self}/assets/wallpaper/wallhaven-pkwxxm_3840x2160.png";
      };

      # 顶部栏
      bar.main = {
        position = "top";
        thickness = 34;
        background_opacity = 1.0;
        radius = 12;
        margin_edge = 10;
        padding = 14;
        widget_spacing = 6;
        shadow = true;
        auto_hide = false;
        reserve_space = true;
        capsule = false;

        start = ["launcher" "wallpaper" "workspaces"];
        center = ["clock"];
        end = ["media" "tray" "notifications" "clipboard" "network" "bluetooth" "volume" "brightness" "battery" "control-center" "session"];
      };

      # 启动器
      shell.launcher = {
        categories = true;
        show_icons = true;
        compact = false;
        app_grid = false;
        sort_by_usage = true;
      };
    };
  };
}
