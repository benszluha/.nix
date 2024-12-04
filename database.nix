{ config, lib, pkgs, ... }:

{
  #NoSQL database
  services.couchdb = {
    enable = true;
    adminUser = "couch";
    adminPass = "couch";
    bindAddress = "127.0.0.1";
    port = 5984;
  };

  #SQL database
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}