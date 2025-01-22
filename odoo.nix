{ config, lib, pkgs, ... }:

{
  services.odoo = {
    enable = true;
    domain = "odoo.local.host";
    settings = {
      options = {
       db_user = "odoo";
       db_password="odoo";
      };
    };
  };
}