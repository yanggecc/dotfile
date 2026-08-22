{ stdenv, lib, dpkg, src, buildFHSEnv }:
let
  app = stdenv.mkDerivation {
    pname = "trae-cn";
    version = "1.107.1";

    inherit src;

    dontConfigure = true;
    dontBuild = true;
    dontStrip = true;

    nativeBuildInputs = [ dpkg ];

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb --fsys-tarfile $src | tar -x --no-same-permissions --no-same-owner
      chmod -R u+w .
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share
      cp -r usr/share/trae-cn usr/share/applications usr/share/appdata \
        usr/share/mime usr/share/pixmaps usr/share/bash-completion usr/share/zsh \
        $out/share/
      chmod -R u+w $out/share
      runHook postInstall
    '';
  };

  fhs = buildFHSEnv {
    name = "trae-cn";

    targetPkgs = pkgs: with pkgs; [
      coreutils
      stdenv.cc.cc.lib
      gtk3
      gdk-pixbuf
      pango
      cairo
      glib
      atk
      at-spi2-atk
      at-spi2-core
      alsa-lib
      nss
      nspr
      cups
      libxkbcommon
      libdrm
      mesa
      libgbm
      vulkan-loader
      fontconfig
      freetype
      harfbuzz
      libsecret
      libnotify
      libayatana-appindicator
      gnutls
      libcap
      libunwind
      libpulseaudio
      libgcrypt
      libgpg-error
      libtasn1
      libidn2
      libunistring
      nettle
      p11-kit
      dbus
      expat
      curl
      udev
      icu
      krb5
      xdg-utils
      xorg.libX11
      xorg.libXext
      xorg.libXrandr
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXfixes
      xorg.libxcb
      xorg.libxkbfile
      xorg.libXcursor
      xorg.libXinerama
      xorg.libXScrnSaver
    ];

    runScript = "${app}/share/trae-cn/bin/trae-cn";
  };
in
stdenv.mkDerivation {
  pname = "trae-cn";
  version = "1.107.1";

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;
  dontUnpack = true;

  phases = [ "installPhase" ];

  buildInputs = [ fhs ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cat > $out/bin/trae-cn <<EOF
    #!${stdenv.shell}
    exec ${fhs}/bin/trae-cn "\$@"
    EOF
    chmod +x $out/bin/trae-cn

    mkdir -p $out/share
    cp -r ${app}/share/applications $out/share/applications
    cp -r ${app}/share/mime $out/share/mime
    cp -r ${app}/share/pixmaps $out/share/pixmaps
    cp -r ${app}/share/appdata $out/share/appdata
    cp -r ${app}/share/bash-completion $out/share/bash-completion
    cp -r ${app}/share/zsh $out/share/zsh

    for f in $out/share/applications/*.desktop; do
      substituteInPlace "$f" \
        --replace "/usr/share/trae-cn/bin/trae-cn" "$out/bin/trae-cn" \
        --replace "/usr/share/trae-cn/trae-cn" "$out/bin/trae-cn"
    done
    runHook postInstall
  '';

  meta = with lib; {
    description = "TRAE, The Real AI Engine (CN edition)";
    homepage = "https://trae.ai/";
    mainProgram = "trae-cn";
    platforms = [ "x86_64-linux" ];
    license = licenses.unfree;
  };
}