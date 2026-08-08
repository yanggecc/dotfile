_: let
  windowRules = [
    {
      geometry-corner-radius = let
        radius = 20.0;
      in {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
    }
    {
      matches = [
        {is-floating = true;}
      ];
      shadow.enable = true;
    }
    {
      matches = [
        {
          is-window-cast-target = true;
        }
      ];
      focus-ring = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
      border = {
        inactive.color = "#7d0d2d";
      };
      shadow = {
        color = "#7d0d2d70";
      };
      tab-indicator = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
    }
    {
      matches = [{app-id = "ghostty";}];
      open-on-workspace = "2";
    }
    {
      matches = [{app-id = "org.gnome.Nautilus";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "org.gnome.Evince";}];
      open-floating = true;
    }
    {
      matches = [
        {
          app-id = "ghostty";
          title = "Picture-in-Picture";
        }
      ];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
      default-column-width = {
        fixed = 480;
      };
      default-window-height = {
        fixed = 270;
      };
    }
    {
      matches = [{title = ".*Preferences.*";}];
      open-floating = true;
    }
    {
      matches = [{title = ".*Settings.*";}];
      open-floating = true;
    }
    {
      matches = [{title = ".*设置.*";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "dialog";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "popup";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "task_dialog";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "gcr-prompter";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "xdg-desktop-portal-gtk";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "nm-connection-editor";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "pavucontrol";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "pavucontrol-qt";}];
      open-floating = true;
    }
  ];
in {
  programs.niri.settings.window-rules = windowRules;
}
