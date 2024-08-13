{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchurl {
        url = "https://github.com/hari-741/Arch/releases/download/test/MyLogin.zip";
        sha256 = "18v64pc5fzvbgn5nwrss5svr47x0lrd5x3fdimx9x5swc8spqp0w";
    };
    dontUnpack = true;

    installPhase = ''
        mkdir -p $out
        ${pkgs.unzip}/bin/unzip $src
        cd MyLogin
        cp -r ./* $out/
        '';
}

