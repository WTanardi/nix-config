{
  config,
  pkgs,
  lib,
  ...
}:

let
  sessionTemplate =
    { name, dir }:
    {
      name = ".config/tmuxp/${name}.yaml";
      value.text = ''
        session_name: ${name}
        start_directory: ${dir}
        windows:
          - window_name: code
            focus: true
            panes:
              - pane
          - window_name: term
            panes:
              - pane
      '';
    };

  sessions = [
    {
      name = "00-bcas-web";
      dir = "~/code/bcas/bcas-webadmin/";
    }
    {
      name = "01-bcas-config";
      dir = "~/code/bcas/bcas-configuration/";
    }
    {
      name = "02-bcas-custom";
      dir = "~/code/bcas/bcas-customService/";
    }
    {
      name = "03-bcas-gm";
      dir = "~/code/bcas/bcas-gateway-master/";
    }
    {
      name = "04-bcas-gp";
      dir = "~/code/bcas/bcas-gateway/";
    }
    {
      name = "10-bba-web";
      dir = "~/code/bba/bba-mbr-webadmin/";
    }
    {
      name = "11-bba-wf";
      dir = "~/code/bba/bba-workflow-service/";
    }
    {
      name = "12-bba-custom";
      dir = "~/code/bba/bba-custom-service/";
    }
    {
      name = "20-bci-web";
      dir = "~/code/bci/bci-web-vkyc/";
    }
    {
      name = "21-bci-wf";
      dir = "~/code/bci/bci-workflow-service/";
    }
    {
      name = "22-bci-custom";
      dir = "~/code/bci/bci-custom-service/";
    }
    {
      name = "30-bss-web";
      dir = "~/code/bss/bss-webadmin/";
    }
    {
      name = "31-bss-workflow";
      dir = "~/code/bss/bss-workflow-service/";
    }
    {
      name = "32-bss-custom";
      dir = "~/code/bss/bss-custom-service/";
    }
    {
      name = "33-bss-gateway";
      dir = "~/code/bss/bss-gateway/";
    }
    {
      name = "98-ces";
      dir = "~/code/ces";
    }
    {
      name = "99-nix";
      dir = "~/nix-config";
    }
  ];
in
{
  home.file = lib.listToAttrs (map sessionTemplate sessions);

  programs.tmux = {
    enable = true;
    tmuxp.enable = true;

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

      bind s choose-tree -Zs -O name

    '';
  };
}
