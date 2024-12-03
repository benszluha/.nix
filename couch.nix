{ config, lib, pkgs, ... }:

{
  services.couchdb = {
    enable = true;
    adminUser = "couch";
    adminPass = "couch";
    bindAddress = "127.0.0.1";
    port = 5984;
  };
}