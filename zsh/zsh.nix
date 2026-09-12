{ config, pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      autosuggestion = {
        enable = true;
      };
      oh-my-zsh = {
        enable = true;
      };
      shellAliases = {
        n = "nvim";
        ls = "eza --icons=always";
        cd = "z";
        ll = "eza -l";
        la = "eza -l -a";
        sau = "sudo apt update && sudo apt upgrade && sudo apt autoremove";
        c = "clear";
        lg = "lazygit";
        hms = "home-manager switch --flake ~/nix-config/.#williamtanardi";
      };
      initExtra = ''
        _tmuxp_load_all() {
          local config_dir="''${XDG_CONFIG_HOME:-$HOME/.config}/tmuxp"
          local f name
          for f in ''${config_dir}/*.{yaml,yml,json}(N); do
            name="''${f:t:r}"
            tmux has-session -t "$name" 2>/dev/null && continue
            tmuxp load --yes -d --no-progress "$f" </dev/null
          done
        }

        _tmuxp_boot() {
          _tmuxp_load_all
          [[ -z ''${TMUX:-} ]] || return
          tmux attach-session 2>/dev/null
        }

        tx() {
          local session config_dir="''${XDG_CONFIG_HOME:-$HOME/.config}/tmuxp"
          
          # Load all sessions if you pass 'start' or 'all'
          if [[ $1 == start || $1 == all ]]; then
            _tmuxp_boot
            return
          fi
          
          if (( $# )); then
            session="$1"
          else
            session=$(print -l -- ''${config_dir}/*.{yaml,yml,json}(N:t:r) | fzf --prompt 'tmuxp> ') || return
          fi
          
          session="''${session#"''${session%%[![:space:]]*}"}"
          session="''${session%"''${session##*[![:space:]]}"}"
          [[ -n $session ]] || return
          tmuxp load --yes "$session"
        }
      '';
    };
  };
}
