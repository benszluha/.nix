# python.nix
# A basic, systemwide confg for python development
{config, lib, pkgs, ...}:

{
  environment.systemPackages = [
    pkgs.python
    pkgs.wheel
    pkgs.poetry
  ]; #System Packages

  
}
