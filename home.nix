{ pkgs, ... }:

{
  home = {
    homeDirectory = "/home/sery";

    packages = with pkgs; [
      lunarvim
    ];

    stateVersion = "23.11";
    username = "sery";
  };

  programs = {
    alacritty = {
      enable = true;

      settings = {
        font = {
          normal.family = "Iosevka NFM";
          size = 12;
        };

        mouse.hide_when_typing = true;

        window = {
          opacity = 0.75;

          padding = {
            x = 4;
            y = 4;
          };
        };
      };
    };

    bash.enable = true;
    firefox.enable = true;

    git = {
      enable = true;
      userEmail = "whole-white-whale@yandex.ru";
      userName = "Sergey Kirichenko";
    };

    home-manager.enable = true;
    lazygit.enable = true;

    neovim = {
      defaultEditor = true;
      enable = true;

      extraConfig = ''
        set expandtab shiftwidth=0 tabstop=2
      '';
    };
  };

  services = {
    picom.enable = true;

    polybar = {
      enable = true;
      script = "polybar top &";

      settings = {
        "bar/top" = {
          width = "100%:-12px";
          height = "32px";

          offset-x = "6px";
          offset-y = "6px";

          background = "#313244";
          foreground = "#cdd6f4";

          radius = 8;
          line-size = 2;
          padding = 1;

          font-0 = "Iosevka NFM:size=12;3";

          modules-left = "bspwm";
          modules-center = "date";
          modules-right = "network pulseaudio battery xkeyboard";
        };

        "module/bspwm" = {
          type = "internal/bspwm";

          label-dimmed = "%name%";
          label-dimmed-padding = 1;

          label-empty = "%name%";
          label-empty-padding = 1;

          label-focused = "%name%";
          label-focused-padding = 1;
          label-focused-underline = "#a6e3a1";

          label-occupied = "%name%";
          label-occupied-padding = 1;
          label-occupied-underline = "#89b4fa";

          label-urgent = "%name%";
          label-urgent-padding = 1;
          label-urgent-underline = "#f38ba8";
        };

        "module/date" = {
          type = "internal/date";
          date = "%a %b %d %H:%M";
        };

        "module/network" = {
          type = "internal/network";
          interface-type = "wireless";

          label-connected = "%essid%";
          label-connected-padding = 1;
          label-connected-underline = "#a6e3a1";

          label-disconnected = "null";
          label-disconnected-padding = 1;
          label-disconnected-underline = "#89b4fa";
        };

        "module/pulseaudio" = {
          type = "internal/pulseaudio";

          label-muted = "null";
          label-muted-padding = 1;
          label-muted-underline = "#89b4fa";

          label-volume = "%percentage:3%%";
          label-volume-padding = 1;
          label-volume-underline = "#a6e3a1";
        };

        "module/battery" = {
          type = "internal/battery";

          adapter = "ACAD";
          battery = "BAT1";

          label-charging = "%percentage:3%%";
          label-charging-padding = 1;
          label-charging-underline = "#a6e3a1";

          label-discharging = "%percentage:3%%";
          label-discharging-padding = 1;
          label-discharging-underline = "#89b4fa";

          label-full = "%percentage:3%%";
          label-full-padding = 1;
          label-full-underline = "#f9e2af";

          label-low = "%percentage:3%%";
          label-low-padding = 1;
          label-low-underline = "#f38ba8";
        };

        "module/xkeyboard" = {
          type = "internal/xkeyboard";
          label-indicator-on = "";

          label-layout = "%layout%";
          label-layout-padding = 1;
          label-layout-underline = "#89b4fa";
        };
      };
    };

    sxhkd = {
      enable = true;

      keybindings = {
        "super + Escape" = "pkill -USR1 sxhkd";
        "super + Return" = "alacritty";
        "super + w" = "firefox";
        "super + {_,ctrl + ,shift + }c" = "bspc node {-c,-p cancel,-k}";
        "super + {_,ctrl + ,shift + }{h,j,k,l}" = "bspc node {-f,-p,-s} {west,south,north,east}";
        "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '^{1-8}'";
        "super + ctrl + m" = "bspc desktop -l next";
        "super + ctrl + {t,p,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
        "super + ctrl + {x,y,z}" = "bspc node -g {locked,sticky,private}";
      };
    };
  };

  xsession.windowManager.bspwm = {
    enable = true;

    monitors.eDP-1 = [
      "1"
      "2"
      "3"
      "4"
      "5"
      "6"
      "7"
      "8"
    ];

    settings = {
      border_width = 2;
      focused_border_color = "#a6e3a1";
      normal_border_color = "#6c7086";
      split_ratio = 0.5;
    };
  };
}
