{
  # Import Nixpkgs
  pkgs, ...
}:

{
  # Enable Docker
  virtualisation.docker.enable = true;
  users.users.nixos.extraGroups = [ "docker" ];
}
