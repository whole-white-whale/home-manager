{ pkgs, ... }:

{
  home = {
    homeDirectory = "/home/sery";
    stateVersion = "23.11";
    username = "sery";
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
