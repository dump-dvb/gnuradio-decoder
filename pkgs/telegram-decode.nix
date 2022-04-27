{ pkgs, lib, stdenv }:
stdenv.mkDerivation {
  name = "telegram-decode";
  version = "0.1.0";

  src = ../.;

  buildInputs = [ (pkgs.python39.withPackages (ps: with ps; [ crcmod requests ])) ];
  propagatedBuildInputs = [ (pkgs.python39.withPackages (ps: with ps; [ crcmod requests ])) ];

  installPhase = ''
    mkdir -p $out/bin
    cp decode_telegrams.py $out/bin
    cp unittest_data_collector.py $out/bin
  '';
}
