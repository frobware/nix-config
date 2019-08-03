{ config, lib, pkgs, ... }: {
  services.dbus.packages = with pkgs; [ gnome3.dconf ];

  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
    enable = true;
    layout = "us";
    xkbOptions = "ctrl:nocaps";
    libinput.enable = true;
    synaptics.enable = false;
  };

  # gtk.gtk3.extraConfig = {
  #   text = { ''
	# 	  [Settings]
  #     gtk-font-name=DejaVu Sans 14
  #     gtk-icon-theme-name=Adwaita
  #     gtk-theme-name=Adapta-Nokto-Eta
	# 	  gtk-application-prefer-dark-theme=true
  #     gtk-key-theme-name=Emacs
  #   ''
  #   };
  # };
  
	environment.etc."xdg/gtk-3.0/settings.ini" = {
		text = ''
			[Settings]
      gtk-font-name=DejaVu Sans 14
      gtk-icon-theme-name=Adwaita
      gtk-theme-name=Adapta-Nokto-Eta
			gtk-application-prefer-dark-theme=true
      gtk-key-theme-name=Emacs
		'';
		mode = "444";
	};
}
