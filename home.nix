{ pkgs, ... }:

{
  home = {
    homeDirectory = "/home/sery";
    stateVersion = "23.11";
    username = "sery";
  };

  programs.bash.enable = true;

  services.sxhkd = {
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
