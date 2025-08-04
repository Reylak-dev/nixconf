{ lib, config, pkgs, ... }:
{

  options = {
    nvidiaDrivers.enable = lib.mkEnableOption "enables the nvidia drivers";
  };

  config = lib.mkIf config.nvidiaDrivers.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      graphics.enable = true;

      nvidia = {
	modesetting.enable = true;
	open = false;
	nvidiaSettings = true;
	package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
  };
}
