{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = [pkgs.mpvScripts.mpris];
    config = {
      volume = 100;
      volume-max = 200;
      osd-bar = "no";
      osc = "no";
    };
  };

  home.packages = with pkgs; [
    amberol
    (celluloid.override {youtubeSupport = true;})
    pamixer
    easyeffects
    (import ./yesplaymusic-appimage.nix { inherit pkgs; })
  ];
}
