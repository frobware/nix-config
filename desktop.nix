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
  
	environment.etc."xdg/gtk-3.0/settings.ini" = {
		text = ''
			[Settings]
      gtk-font-name=DejaVu Sans 12
      gtk-icon-theme-name=Adwaita
      gtk-theme-name=Adapta-Nokto-Eta
			gtk-application-prefer-dark-theme=true
      gtk-key-theme-name=Emacs
		'';
		mode = "444";
	};

  # gtk3 = {
  #   fontName = "DejaVu Sans 10";
  #   iconThemeName = "Adwaita";
  #   themeName= "Adapta-Nokto-Eta";
  #   gtk3.extraConfig = {
  #     gtk-recent-files-max-age = 0;
  #     gtk-recent-files-limit = 0;
  #     gtk-cursor-blink = false;
  #     gtk-key-theme-name = "Emacs";
  #   };      
	# };
}
