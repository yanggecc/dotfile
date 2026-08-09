{pkgs, ...}: {
  imports = [
    ./media
    ./messaging
    ./screenshot
    ./productivity
    ./tools
    ./browsers
    ./develop
  ];
}
