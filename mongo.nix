{ config, lib, pkgs, ... }:

{
    services.mongodb = {
        enable = true;
        package = mongodb-ce;
        enableAuth = true;
        initialRootPassword = "F@irplay";
        bind_ip = "127.0.0.1";
    };
}