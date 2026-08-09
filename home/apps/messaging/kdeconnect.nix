{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.kdeconnect-kde
  ];

  # 非 KDE 环境（Niri/Wayland）下自动启动 KDE Connect daemon
  systemd.user.services.kdeconnect = {
    Unit = {
      Description = "KDE Connect daemon";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnect-indicator";
      Restart = "on-failure";
      RestartSec = 3;
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
