{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "catppuccin-mocha-blue";
    src = pkgs.fetchurl {
        url = "https://github.com/catppuccin/gtk/releases/download/v1.0.3/catppuccin-mocha-blue-standard+default.zip";
        sha256 = "1p1vflydcp184sxn8x7ffc6kfil031816hfymwzn4cpbri8i10c3";
    };
    dontUnpack = true;

    installPhase = ''
        mkdir -p $out/share/themes
        ${pkgs.unzip}/bin/unzip $src -d $out/share/themes
        '';
}
