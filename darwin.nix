{
  username,
  inputs,
  lib,
  ...
}:

{
  # Determinate Nix owns the daemon and /etc/nix/nix.conf
  nix.enable = false;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  system = {
    stateVersion = 6;
    primaryUser = username;
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  };

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  programs.zsh.enable = true;

  # GUI apps (Cursor, nvim) do not source zshrc; keep user packages on PATH.
  environment.systemPath = lib.mkBefore [
    "/etc/profiles/per-user/${username}/bin"
  ];

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  # Official Flutter + CocoaPods. nixpkgs flutter lives in the read-only
  # store and breaks iOS simulator codesign / framework unpack on macOS 15.4+.
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    brews = [ "cocoapods" ];
    casks = [ "flutter" ];
  };

  system.activationScripts.extraActivation.text = ''
    if [ -d /Applications/Xcode.app/Contents/Developer ]; then
      xcode-select --switch /Applications/Xcode.app/Contents/Developer || true
    fi
  '';
}
