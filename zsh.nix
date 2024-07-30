{ config, pkgs, ...}:

let
  zshAliases = {
    cls = "clear";
    cat = "bat";
    ls = "eza --icons --group-directories-first";
  };
in
{
    programs.zsh = {
      autosuggestion.enable = true;
      enable = true;
      enableCompletion = true;
      shellAliases = zshAliases;
      syntaxHighlighting.enable = true;
      initExtra = "
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      ";
    };

    programs.zsh.zplug = {
      enable = true;
      plugins = [
      {
        name = "romkatv/powerlevel10k";
        tags = ["as:theme" "depth:1"];
      }
      {
        name = "plugins/sudo";
        tags = ["from:oh-my-zsh"];
      }
      {
        name = "plugins/extract";
        tags = ["from:oh-my-zsh"];
      }
      ];
    };
}
