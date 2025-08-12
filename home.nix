{ config, pkgs, ... }:
let 
  zshCfg = import ./config/zsh/zsh.nix;
  nvimCfg = import ./config/nvim/nvim.nix;
  kittyCfg = import ./config/kitty/kitty.nix;
  myTex = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-small latexmk xetex luatex biblatex biber beamer amsmath;
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
}
