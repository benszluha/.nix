{ config, pkgs, ... }:

{
    #Install home-manager and have it manage itself
    programs.home-manager = {
        enable = true;
    }; #programs.home-manager

    home.username = "nixos";
    home.homeDirectory = "/home/nixos";

    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            plugins = ["git"];
            theme = "amuse";
        }; #oh-my-zsh

        shellAliases = {
            nix_rebuild = "sudo nixos-rebuild switch --impure --flake ~/.nix";
            nix_push = "cd ~/.nix && git push -u origin main" 
            win_host = "cd /mnt/c";
        }; #Shell Aliases (zsh)

        initExtra = ''
        ${pkgs.neofetch}/bin/neofetch
        '';
    }; #zsh
  
    programs.git = {
        enable = true;
        userName = "benszluha";
        userEmail = "ben@szluha.co.za";
    }; #git

    programs.ssh = {
      enable = true;
    }; #ssh


    home.packages = with pkgs; [
        neofetch

        #utils
        pciutils
        usbutils
        p7zip
        zip
        rar
    ]; #home.packages

    home.stateVersion = "24.05";
}
