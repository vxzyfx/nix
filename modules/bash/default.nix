{config, lib, ...}:
with lib;
let
  cfg = config.modules.bash;
in
{
  options.modules.bash = { enable = mkEnableOption "bash"; };
  config = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        virsh = "doas virsh";
        nft = "doas nft";
        d = "doas";
      };
    };
  };
}
