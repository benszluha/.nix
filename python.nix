# python.nix
# A basic, systemwide confg for python development
{config, lib, pkgs, ...}:

{
  environment.systemPackages = [
    pkgs.python312
    pkgs.python312Packages.wheel
    pkgs.python312Packages.poetry-core
    pkgs.poetry2nix
  ]; #System Packages

  
}
