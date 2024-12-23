{ config, lib, pkgs, ... }:

{
    services.mongodb = {
        enable = true;
        package = pkgs.mongodb-ce;
        enableAuth = true;
        initialRootPassword = "F@irplay";
        bind_ip = "127.0.0.1";
    };

    environment.systemPackages = with pkgs; [
        mongosh
    ];
}