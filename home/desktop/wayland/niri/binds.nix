{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
  in {
    "XF86AudioPlay".action = playerctl "play-pause";
    "XF86AudioStop".action = playerctl "pause";
    "XF86AudioPrev".action = playerctl "previous";
    "XF86AudioNext".action = playerctl "next";

    # 音量控制
    "XF86AudioRaiseVolume".action = spawn [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.1+"
    ];
    "XF86AudioLowerVolume".action = spawn [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.1-"
    ];
    "XF86AudioMute".action = spawn [
      "wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SINK@"
      "toggle"
    ];
    "XF86AudioMicMute".action = spawn [
      "wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SOURCE@"
      "toggle"
    ];

    # 亮度控制
    "XF86MonBrightnessUp".action = spawn [
      "brightnessctl"
      "-c"
      "backlight"
      "set"
      "+30"
    ];
    "XF86MonBrightnessDown".action = spawn [
      "brightnessctl"
      "-c"
      "backlight"
      "set"
      "30-"
    ];

    # 截图
    "Print".action.screenshot-screen = {write-to-disk = true;};
    "Mod+Shift+Alt+S".action.screenshot-window = {write-to-disk = true;};
    "Mod+Shift+S".action.screenshot = {show-pointer = false;};

    "Mod+Return".action = spawn "${pkgs.kitty}/bin/kitty";
    "Mod+D".action = spawn "${pkgs.anyrun}/bin/anyrun";

    # 窗口管理
    "Mod+Q".action = close-window;
    "Mod+S".action = switch-preset-column-width;
    "Mod+F".action = maximize-column;

    "Mod+Shift+F".action = expand-column-to-available-width;
    "Mod+Space".action = toggle-window-floating;
    "Mod+W".action = toggle-column-tabbed-display;

    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;
    "Mod+Tab".action = switch-focus-between-floating-and-tiling;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Plus".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Plus".action = set-window-height "+10%";

    # 移动焦点
    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;

    # 切换工作区
    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;

    # 移动窗口/列
    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+K".action = move-column-to-workspace-up;
    "Mod+Shift+J".action = move-column-to-workspace-down;

    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
  };
}
