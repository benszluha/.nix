{config, lib, pkgs, ...} :

{
  services.jupyter = {
    enable = true;
    ip = "10.230.126.114";
    port = 1234;
    notebookDir = "~/.notebooks";
  };
}
