{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3
    python3Packages.pip
    mariadb
    mariadb.client
    nginx
    dolibarr
  ];

  #services.mysql.enable = true;
  services.nginx.enable = true;
  services.nginx.virtualHosts."localhost" = {
    root = "/var/www/dolibarr/htdocs";
    locations."/".proxyPass = "http://127.0.0.1:8000";
  };

  users.users.dolibarr-user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "nginx" ];
  };

  systemd.services.dolibarr = {
    description = "Dolibarr service";
    after = [ "network.target" "mysql.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.python3}/bin/python3 /var/www/dolibarr/htdocs/index.php";
      WorkingDirectory = "/var/www/dolibarr";
      User = "dolibarr-user";
      Group = "wheel";
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 3306 8000 ];
  networking.firewall.enable = true;
}
