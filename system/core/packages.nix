{pkgs, ...}: {
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    opencode
    appimage-run
    wget
    curl
    nodejs
    dpkg
    vscode
  ];
}
