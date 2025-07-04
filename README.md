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
  && gh repo clone WTanardi/nix-config --depth=1 \
  && cd nix-config/ \
  && home-manager switch --flake ./nix-config#willi -b bckp \
"
```
