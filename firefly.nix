{ config, lib, pkgs, ... }:

{
  services.firefly-iii = {
    enable = true;
    enableNginx = true;
    virtualHost = "firefly.local";
    dataDir = "/var/lib/firefly-iii";

    settings = {
      APP_KEY_FILE = "/home/nixos/.firefly-iii.key";
      APP_ENV = "production";
    };
  };
}