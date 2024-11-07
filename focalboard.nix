{config, lib, pkgs, ...}:

{
  systemd.services.focalboard = {
    description = "Focalboard Container";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.docker}/bin/docker start -a focal";
      ExecStop = "${pkgs.docker}/bin/docker stop -t 2 focal";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
