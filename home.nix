{ config, pkgs, ... }:
let 
  # Configs externas
  zshCfg = import ./config/zsh/zsh.nix;
  nvimCfg = import ./config/nvim/nvim.nix;
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
  home.username = "tompi4";
  home.homeDirectory = "/home/tompi4";
  home.stateVersion = "25.05";
  
  home.packages = [
    pkgs.bat
    myTex
    pkgs.python3Packages.pygments
    pkgs.texstudio
  ];
  
  # Traer módulos externos
  programs.zsh = zshCfg;
  programs.neovim = nvimCfg;
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
    "nvim/init.lua".source = ./config/nvim/init.lua;

    # core
    "nvim/lua/core/options.lua".source =
      ./config/nvim/lua/core/options.lua;
    "nvim/lua/core/keymaps.lua".source =
      ./config/nvim/lua/core/keymaps.lua;

    # plugins
    "nvim/lua/plugins/colortheme.lua".source =
      ./config/nvim/lua/plugins/colortheme.lua;
    "nvim/lua/plugins/neotree.lua".source =
      ./config/nvim/lua/plugins/neotree.lua;
  };
}

