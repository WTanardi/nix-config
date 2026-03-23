{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    prefix = "C-a";
    baseIndex = 1;
    mouse = true;

    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
    ];

    extraConfig = ''
      ##### PREFIX #####

      unbind C-b
      bind C-a send-prefix

      ##### WINDOW NAVIGATION #####

      # Ctrl+Tab → next window
      bind -n C-Tab next-window

      # Ctrl+Shift+Tab → previous window
      bind -n C-S-Tab previous-window

      ##### WINDOW MANAGEMENT #####

      # new tab
      bind -n C-t new-window

      # close tab WITH CONFIRMATION
      # -p sets the prompt text; #W is the window name
      bind -n C-q confirm-before -p "Kill window #W? (y/n)" kill-window

      ##### DETACHING #####

      # Standard detach (Prefix + d)
      # This keeps the session alive in the background
      bind d detach-client

      ##### DIRECT WINDOW ACCESS #####

      bind -n C-1 select-window -t 1
      bind -n C-2 select-window -t 2
      bind -n C-3 select-window -t 3
      bind -n C-4 select-window -t 4
      bind -n C-5 select-window -t 5
      bind -n C-6 select-window -t 6
      bind -n C-7 select-window -t 7
      bind -n C-8 select-window -t 8
      bind -n C-9 select-window -t 9

      ##### PERSISTENT SESSIONS #####

      set -g @continuum-restore 'on'
      set -g @resurrect-capture-pane-contents 'on'

      ##### QUALITY OF LIFE #####

      set -g escape-time 0
      set -g history-limit 10000
      set -g renumber-windows on

      ##### BETTER COLORS #####

      set -ga terminal-overrides ",*:RGB"

      bind s choose-tree -Zs

    '';
  };
}
