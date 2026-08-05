{ pkgs, ... }:

let
  myPython = pkgs.python313.withPackages (
    ps: with ps; [
      pip
    ]
  );
in
{
  home.packages = with pkgs; [
    myPython
    uv
  ];
}
