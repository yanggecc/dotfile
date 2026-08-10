{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons=auto";
      ll = "eza -la --icons=auto";
      la = "eza -a --icons=auto";
      lt = "eza --tree --icons=auto";
      cat = "bat --theme=gruvbox-dark";
      grep = "rg";
      lg = "lazygit";
      v = "nvim";
      yz = "yazi";
    };
    shellAbbrs = {
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gd = "git diff";
      gco = "git checkout";
    };
    functions = {
      fish_greeting = "";

      proxy = ''
        set -gx http_proxy http://127.0.0.1:20171
        set -gx https_proxy http://127.0.0.1:20171
        set -gx all_proxy socks5://127.0.0.1:20170
        set -gx socks_proxy socks5://127.0.0.1:20170
        echo "proxy enabled"
      '';

      unproxy = ''
        set -e http_proxy
        set -e https_proxy
        set -e all_proxy
        set -e socks_proxy
        echo "proxy disabled"
      '';
    };
    interactiveShellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
      set -gx EDITOR nvim
      set -gx VISUAL nvim
    '';
    loginShellInit = ''
      # 启动 niri 会话
      if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec niri-session
      end
    '';
  };

  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      palette = "gruvbox_dark";

      palettes.gruvbox_dark = {
        bg0 = "#282828";
        bg1 = "#3c3836";
        bg2 = "#504945";
        fg0 = "#fbf1c7";
        fg1 = "#ebdbb2";
        fg2 = "#d5c4a1";
        red = "#fb4934";
        green = "#b8bb26";
        yellow = "#fabd2f";
        blue = "#83a598";
        purple = "#d3869b";
        aqua = "#8ec07c";
        orange = "#fe8019";
        gray = "#928374";
      };

      add_newline = true;

      format = ''
        [╭──╼](bold blue) $hostname $os
        [┆](bold blue) $directory$git_branch$git_commit$git_state$git_metrics$git_status$nix_shell
        [╰─>](bold blue) $character
      '';

      os = {
        format = "on [($name $codename$version $symbol )]($style)";
        style = "bold blue";
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold red";
        disabled = false;
      };

      character = {
        format = "$symbol";
        success_symbol = "[❯](bold green)";
        error_symbol = "[✗](bold red) ";
        disabled = false;
      };

      time = {
        disabled = false;
        format = " [$time]($style)";
        time_format = "%H:%M";
        utc_time_offset = "local";
        style = "pale blue";
      };

      cmd_duration = {
        disabled = false;
        min_time = 250;
        show_milliseconds = false;
        show_notifications = false;
        format = "was [$duration](bold green)";
      };

      nix_shell = {
        disabled = false;
        heuristic = false;
        format = "[   ](fg:blue bold)";
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
      };
    };
  };
}
