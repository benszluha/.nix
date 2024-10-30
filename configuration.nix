# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  time.timeZone = "Africa/Johannesburg";

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  console = {
    font = "";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };


  programs.zsh = {
    enable = true;
   
    ohMyZsh = {
      enable = true;
      plugins = ["git" "thefuck"];
      theme = "amuse";
    };
  };

  users = {
    defaultUserShell = pkgs.bash;

    users = {
      nixos = {
        shell = pkgs.zsh;
      };
    };
  };

  services.xserver = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    unzip
    btop
    thefuck
    gh

    direnv
    nix-direnv

    geany
    vscode

    jupyter-all

    python312
    python312Packages.pip
    python312Packages.wheel
  ];  

  programs.ssh = {
    startAgent = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
