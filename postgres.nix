{lib, pkgs, ...}:

{
  services.postgressql = {
    enable = true;
    package = "postgresql_16";
    #settings = {
    #  port = 4321;
    #};
    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser auth-method
      local all      all    trust
    '';
  };
}
