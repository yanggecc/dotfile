{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
    ollama
  ];
}