{ pkgs, ... }:

{
  gtk = {
    enable = true;

    font = {
      name = "Iosevka NFM";
      size = 12;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
  };

  home = {
    file.".config/lvim/config.lua".text = ''
      lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
      lvim.colorscheme = "catppuccin"

      lvim.plugins = {
        {
          "catppuccin/nvim",
          name = "catppuccin",

          opts = {
            transparent_background = true,
          }
        }
      }

      vim.diagnostic.config({
        virtual_text = false,
      })

      vim.opt.relativenumber = true
    '';

    homeDirectory = "/home/sery";

    packages = with pkgs; [
      brightnessctl
      lunarvim
      telegram-desktop
    ];

    stateVersion = "23.11";
    username = "sery";
  };

  programs = {
    alacritty = {
      enable = true;

      settings = {
        colors = {
          primary = {
            foreground = "#cdd6f4";
            background = "#1e1e2e";
          };

          search = {
            matches = {
              foreground = "#1e1e2e";
              background = "#a6adc8";
            };

            focused_match = {
              foreground = "#1e1e2e";
              background = "#a6e3a1";
            };
          };

          hints = {
            start = {
              foreground = "#1e1e2e";
              background = "#f9e2af";
            };

            end = {
              foreground = "#1e1e2e";
              background = "#a6adc8";
            };
          };

          footer_bar = {
            foreground = "#1e1e2e";
            background = "#a6adc8";
          };

          normal = {
            black = "#45475a";
            red = "#f38ba8";
            green = "#a6e3a1";
            yellow = "#f9e2af";
            blue = "#89b4fa";
            magenta = "#f5c2e7";
            cyan = "#94e2d5";
            white = "#bac2de";
          };

          bright = {
            black = "#585B70";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#A6ADC8";
          };
        };

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
    direnv.enable = true;
    firefox.enable = true;

    git = {
      enable = true;
      userEmail = "whole-white-whale@yandex.ru";
      userName = "Sergey Kirichenko";
    };

    home-manager.enable = true;
    lazygit.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;

      extraConfig = ''
        set expandtab shiftwidth=0 tabstop=2
      '';
    };

    rofi = {
      enable = true;
      font = "Iosevka NFM 12";
      theme = "Arc-Dark";
    };

    starship.enable = true;

    zathura = {
      enable = true;

      options = {
        completion-bg = "#313244";
        completion-fg = "#cdd6f4";

        completion-highlight-bg = "#575268";
        completion-highlight-fg = "#cdd6f4";

        completion-group-bg = "#313244";
        completion-group-fg = "#89b4fa";

        default-bg = "#1e1e2e";
        default-fg = "#cdd6f4";

        font = "Iosevka NFM 12";

        highlight-active-color = "#f5c2e7";
        highlight-color = "#575268";
        highlight-fg = "#f5c2e7";

        index-bg = "#1e1e2e";
        index-fg = "#cdd6f4";

        index-active-bg = "#313244";
        index-active-fg = "#cdd6f4";

        inputbar-bg = "#313244";
        inputbar-fg = "#cdd6f4";

        notification-bg = "#313244";
        notification-fg = "#cdd6f4";

        notification-error-bg = "#313244";
        notification-error-fg = "#f38ba8";

        notification-warning-bg = "#313244";
        notification-warning-fg = "#fae3b0";

        recolor-darkcolor = "#cdd6f4";
        recolor-lightcolor = "#1e1e2e";

        render-loading-bg = "#1e1e2e";
        render-loading-fg = "#cdd6f4";

        statusbar-bg = "#313244";
        statusbar-fg = "#cdd6f4";
      };
    };
  };

  services = {
    picom.enable = true;

    polybar = {
      enable = true;
      package = pkgs.polybarFull;
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
        "super + d" = "rofi -show drun";
        "super + {_,ctrl + ,shift + }c" = "bspc node {-c,-p cancel,-k}";
        "super + {_,ctrl + ,shift + }{h,j,k,l}" = "bspc node {-f,-p,-s} {west,south,north,east}";
        "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '^{1-8}'";
        "super + ctrl + m" = "bspc desktop -l next";
        "super + ctrl + {t,p,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
        "super + ctrl + {x,y,z}" = "bspc node -g {locked,sticky,private}";
        "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86Audio{Lower,Raise}Volume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ {10%-,10%+}";
        "XF86MonBrightness{Down,Up}" = "brightnessctl set {10%-,+10%}";
      };
    };
  };

  xsession = {
    enable = true;

    windowManager.bspwm = {
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
  };
}
