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
      source ~/Configs/sudo.plugin.zsh
      source ~/Configs/extract.plugin.zsh
      ";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      # format = lib.concatStrings [];
      line_break = {
        disabled = false;
      };
      os = {
        disabled = false;
        symbols = {
          Amazon = " ";
          Arch = " ";
          Android = " ";
          Debian = " ";
          Fedora = " ";
          NixOS = " ";
          Ubuntu = " ";
          Windows = " ";
        };
      };
      directory = {
        read_only = " 󰌾";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Configs" = " ";
          "Pictures" = " ";
          "Studies" = " ";
          "Win" = " ";
        };
      };
      aws = {
        symbol = "  ";
      };
      c = {
        symbol = " ";
      };
      dart = {
        symbol = " ";
      };
      docker_context = {
        symbol = " ";
      };
      elixir = {
        symbol = " ";
      }; 
      fossil_branch = {
        symbol = " ";
      };
      git_branch = {
        symbol = " ";
      };
      golang = {
        symbol = " ";
      };
      haskell = {
        symbol = " ";
      };
      hg_branch = {
        symbol = " ";
      };
      hostname = {
        ssh_symbol = " ";
      };
      java = {
        symbol = " ";
      };
      kotlin = {
        symbol = " ";
      };
      lua = {
        symbol = " ";
      };
      nix_shell = {
        symbol = " ";
      };
      nodejs = {
        symbol = " ";
      };
      package = {
        symbol = "󰏗 ";
      };
      php = {
        symbol = " ";
      };
      python = {
        symbol = " ";
      };
      rust = {
        symbol = "󱘗 ";
      };
      zig = {
        symbol = " ";
      };
    };
  };
}
