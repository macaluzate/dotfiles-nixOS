{ config, pkgs, ... }:
let 
  # Configs externas
  zshCfg = import ./config/zsh/zsh.nix;
  kittyCfg = import ./config/kitty/kitty.nix;

  # Paquete personalizado de TeX
  myTex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-small
      latexmk
      xetex
      luatex
      biblatex
      biber
      beamer
      amsmath;
  };
in
{
  imports = [./config/nvim.nix]; 
  home.username = "tompi4";
  home.homeDirectory = "/home/tompi4";
  home.stateVersion = "25.05";
  
  home.packages = [
    pkgs.bat
    myTex
    pkgs.python3Packages.pygments
    pkgs.texstudio
    pkgs.gcc
    pkgs.ripgrep
    pkgs.fuzzel
    pkgs.alacritty
    pkgs.waybar
    pkgs.ripgrep
    
    
  ];
  
  # Traer módulos externos
  programs.zsh = zshCfg;
  programs.kitty = kittyCfg;
  
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      # obs-composite-blur  # si existe en tu nixpkgs
    ];
  };
  
  programs.home-manager.enable = true;

  # Config adicional para Neovim
  xdg.configFile = {
    # main init.lua
    "nvim/" = {
    source = ./config/nvim;
    recursive = true;

    };

     };
}

