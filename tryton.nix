{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
  ];

  services.docker.enable = true;
  services.docker.package = pkgs.docker;

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
      Group = "tryton-user";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8000 ];
  networking.firewall.enable = true;
}
