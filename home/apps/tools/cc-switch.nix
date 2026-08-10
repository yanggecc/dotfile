{ appimageTools, fetchurl, lib }:

let
  pname = "cc-switch";
  version = "3.19.2"; 
in appimageTools.wrapType2 {
  inherit pname version;

  src = fetchurl {
    url = "https://github.com\${version}/CC-Switch_\${version}_amd64.AppImage";
    hash = "sha256-wA/fI+MvO1B/7T98Ncl8P99GZfVFCG48VbT7MxeS2h4=";
  };

  meta = with lib; {
    description = "A cross-platform desktop All-in-One assistant for Claude Code, Codex, etc.";
    homepage = "https://github.com";
    platforms = [ "x86_64-linux" ];
  };
}
