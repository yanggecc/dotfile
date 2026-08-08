{
  self,
  nixpkgs,
  ...
} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  myvars = import ../vars;
  mylib = import ../lib {
    inherit lib;
    inherit (builtins) builtins;
  };

  args = {inherit inputs lib mylib myvars self;};

  nixosSystems = {
    x86_64-linux = import ./x86_64-linux (args // {system = "x86_64-linux";});
  };

  nixosSystemValues = builtins.attrValues nixosSystems;
in {
  nixosConfigurations =
    lib.attrsets.mergeAttrsList (map (it: it.nixosConfigurations or {}) nixosSystemValues);

  formatter = nixpkgs.lib.genAttrs (builtins.attrNames nixosSystems) (
    system: nixpkgs.legacyPackages.${system}.alejandra
  );
}
