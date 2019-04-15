CWD = $(shell pwd)

%:
	nixos-rebuild -I nixos-config=$(CWD)/configuration.nix $@
