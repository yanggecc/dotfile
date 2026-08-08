{...}: {
  imports = [
    ./boot.nix
    ./users.nix
    ./packages.nix
  ];

  time.timeZone = "Asia/Shanghai";
}
