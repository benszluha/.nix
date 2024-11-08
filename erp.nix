{config, lib, pkgs, ...}:

{
  systemd.services.erp = {
    description = "Focalboard Container";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.docker}/bin/docker compose -f /home/nixos/frappe_docker/pwd.yml up -d";
      ExecStop = "${pkgs.docker}/bin/docker compose -f /home/nixos/frappe_docker/pwd.yml down";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
