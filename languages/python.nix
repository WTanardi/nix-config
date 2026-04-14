{ pkgs, ... }:

# let
#   myPython = pkgs.python313.withPackages (ps:
#     with ps; [
#       # Python packages
#       ps.django
#       ps.pip
#     ]);
# in
{
  # nixpkgs.config.permittedInsecurePackages = [
  # "python-2.7.18.8"
  # The version may change, so you might need to check the exact name from the error message.
  # ];

  home.packages = with pkgs; [
    # Python
    # myPython
    # python27Full
    python3
  ];
}
