{pkgs, ...}:

{
  #enable docker
  users.users.nixos.extraGroups = [ "docker" ];
  virtualisation.docker.enable = true;
  
  #Define the service
  systemd.services.my-container = {
  description = "My Docker Container";
  after = [ "network.target" ];
  wantedBy = [ "multi-user.target" ];

    serviceConfig = {
    #ExecStartPre = "${pkgs.docker}/bin/docker pull ";
    ExecStart = "${pkgs.docker}/bin/docker run -it -p 80:8000 mattermost/focalboard";
    ExecStop = "${pkgs.docker}/bin/docker stop mattermost/focalboard";
    Restart = "always";
    };
  };
}
