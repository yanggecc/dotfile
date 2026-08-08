{
  myvars,
  pkgs,
  ...
}: {
  users.users."${myvars.username}" = {
    isNormalUser = true;
    description = "young";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages = with pkgs; []; #  thunderbird
  };
}
