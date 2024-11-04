# python.nix
# A basic, systemwide confg for python development
{config, lib, pkgs, ...}:

{
  environment.systemPackages = [
    pkgs.python3
    pkgs.poetry
  ]; #System Packages

  
}
