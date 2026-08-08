{...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    substituters = ["https://mirrors.ustc.edu.cn/nix-channels/store"];
    experimental-features = ["nix-command" "flakes"];
  };
}
