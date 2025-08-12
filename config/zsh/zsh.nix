{
  enable = true;
  oh-my-zsh.enable = true;
  oh-my-zsh.theme = "lukerandall";
  oh-my-zsh.plugins = [ "git" ];
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  # tu antiguo .zshrc
  #initExtra = builtins.readFile ./zshrc;

   shellAliases = {
    cat = "bat";
    ll = "ls -la";
    la = "ls -la";
    ".." = "cd ..";
    hms = "home-manager switch";
    hmsf = "home-manager switch flake .";
  };
}
