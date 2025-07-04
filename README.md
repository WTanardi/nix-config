# Billy's nix configuration

## Getting started

### Step 1: Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

### Step 2: Apply Nix config

```sh
nix shell nixpkgs#home-manager nixpkgs#gh --command sh -c "\
  gh auth login \
  && gh repo clone WTanardi/wsl-home --depth=1 \
  && home-manager switch --flake ./wsl-home#willi -b bckp \
"
```
