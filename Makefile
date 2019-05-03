CWD = $(shell pwd)

# cheatsheet https://tin6150.github.io/psg/nixos.html

build:
	sudo nixos-rebuild -I nixos-config=$(CWD)/configuration.nix $@

boot:
	sudo nixos-rebuild -I nixos-config=$(CWD)/configuration.nix $@

switch:
	sudo nixos-rebuild -I nixos-config=$(CWD)/configuration.nix --show-trace $@

upgrade:
	sudo nixos-rebuild -I nixos-config=$(CWD)/configuration.nix switch --upgrade


%:
	sudo nixos-rebuild -I nixos-config=$(CWD)/configuration.nix $@
