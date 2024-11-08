{ config, pkgs, ... }:

{
  users.users.tryton-user = {
    isNormalUser = true;
    extraGroups = [ "docker" ];
  };

  systemd.services.tryton = {
    description = "Tryton service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "docker run -d -p 4321:8000 openlabs/tryton";
      WorkingDirectory = "/home/tryton-user/tryton";
      User = "tryton-user";
      Group = "wheel";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8000 ];
  networking.firewall.enable = true;
}
