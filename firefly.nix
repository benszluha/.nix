{ config, lib, pkgs, ... }:

{
  services.firefly-iii = {
    enable = true;
    enableNginx = true;
    virtualHost = "firefly.localhost";
  };
}