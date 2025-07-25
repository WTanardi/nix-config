{ pkgs, ... }:

let
  myPython = pkgs.python313.withPackages (ps:
    with ps; [
      # Python packages
      ps.django
      ps.pip
    ]);
in {
  home.packages = with pkgs;
    [
      # Python
      myPython
    ];
}
