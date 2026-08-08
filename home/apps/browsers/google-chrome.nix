{pkgs, ...}: {
  # google chrome
  home.packages = with pkgs; [
    (google-chrome.override {
      # Force use Wayland + enable fcitx5 IM
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--enable-wayland-ime"
        "--enable-features=WebRTCPipeWireCapturer,VaapiVideoDecodeLinuxGL"
      ];
    })
  ];

  home.sessionVariables = {
    CHROME_EXECUTABLE = "${pkgs.google-chrome}/bin/google-chrome-stable";
  };
}
