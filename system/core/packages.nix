{pkgs, ...}: {
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    rustdesk
  ];
}
