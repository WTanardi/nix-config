{ config, pkgs, ... }: {
  home = {
    packages = with pkgs;
      [
        # Typescript
        typescript
      ];
  };
}
