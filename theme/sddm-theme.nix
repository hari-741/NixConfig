{ pkgs }:

let
    img = builtins.fetchurl {
        name = "sddm.jpg";
        url = "file:///home/hari/Configs/pic/sddm.jpg";
        sha256 = "f77e9f92ff65debf011f0882f686217ae0630e42527eb0a353d7f6977f250a3a";
    };

    conf = builtins.fetchurl {
        name = "theme.conf";
        url = "file:///home/hari/Configs/theme/theme.conf";
        sha256 = "999fd1baca499b9b11eb3a38b21679568c98a6480d4ebbc6755b9ade4c5e84cb";
    };
in
pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "Kangie";
        repo = "sddm-sugar-candy";
        rev = "d31dbf58286ecdcd3a490cd0c9d9ba2f15c26920";
        sha256 = "0ksslgd75adlky5hvmr77gbim60xdhy19f7ad7izqpkg4i9p7j8w";
    };

    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
        rm $out/theme.conf
        cp -r ${img} $out/sddm.jpg
        cp -r ${conf} $out/theme.conf
        '';
}