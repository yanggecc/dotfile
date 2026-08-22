{ pkgs ? import <nixpkgs> {} }:

let
  pname = "yesplaymusic";
  version = "0.4.10";

  src = pkgs.fetchurl {
    url = "https://github.com/qier222/YesPlayMusic/releases/download/v${version}/YesPlayMusic-${version}.AppImage";
    hash = "sha256-Qj9ZQbHqzKX2QBlXWtey/j/4PqrCJCObdvOans79KW4="; 
  };

  appimageContents = pkgs.appimageTools.extractType2 {
    inherit pname version src;
  };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/yesplaymusic.desktop $out/share/applications/yesplaymusic.desktop
    install -m 444 -D ${appimageContents}/yesplaymusic.png $out/share/icons/hicolor/512x512/apps/yesplaymusic.png
    
    substituteInPlace $out/share/applications/yesplaymusic.desktop \
      --replace 'Exec=AppRun' 'Exec=yesplaymusic'
  '';
}
