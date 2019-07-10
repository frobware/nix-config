# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ./desktop.nix
  ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;

  boot.loader.systemd-boot.enable = true;
  boot.earlyVconsoleSetup = true;

  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "t460s";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Sane font defaults
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig.cache32Bit = true;
    fontconfig.ultimate.preset = "osx";
    fontconfig.ultimate.substitutions = "ms";

    fonts = with pkgs; [
      terminus_font
      source-code-pro
      anonymousPro
      corefonts
      dejavu_fonts
      freefont_ttf
      google-fonts
      inconsolata
      liberation_ttf
      noto-fonts
      powerline-fonts
      source-code-pro
      terminus_font
      ttf_bitstream_vera
      ubuntu_font_family
    ];
  };

  # Select internationalisation properties.
  i18n = {
    # big font in the console
    defaultLocale = "en_US.UTF-8";
    consoleFont = "latarcyrheb-sun32";
    consoleKeyMap = "emacs2";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ag
    bash
    bash-completion
    emacs
    firefox
    gnome3.dconf
    gnome3.gnome-tweaks
    gnumake
    vim
    wget
    xcalib
    zsh
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "ctrl:nocaps";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;
  # services.xserver.synaptics.enable = false;

  # services.xserver.config = ''
  #   Section "InputClass"
  #   Identifier     "Enable libinput for TrackPoint"
  #   MatchIsPointer "on"
  #   Driver         "libinput"
  #   EndSection
  # '';


  # services.xserver = {
  #   enable = true;
  #   layout = "us";
  #   xkbOptions = "ctrl:nocaps";
  #   libinput.enable = true;
  #   synaptics.enable = false;
  #   config = ''
  #     Section "InputClass"
  #     Identifier     "Enable libinput for TrackPoint"
  #     MatchIsPointer "on"
  #     Driver         "libinput"
  #     EndSection
  #   '';
  # };

  # services.xserver.gtk = {
  #   fontName = "DejaVu Sans 10";
  #   iconThemeName = "Adwaita";
  #   themeName= "Adapta-Nokto-Eta";
  #   gtk3.extraConfig = {
  #     gtk-recent-files-max-age = 0;
  #     gtk-recent-files-limit = 0;
  #     gtk-cursor-blink = false;
  #   };
  # };

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  services.dbus.packages = with pkgs; [ gnome3.dconf ];

  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''
    [org.gnome.shell]
    enable-hot-corners=false
    [org.gtk.Settings.FileChooser]
    sort-directories-first=true
    [org.gnome.desktop.interface]
    gtk-key-theme=Emacs
  '';

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  # This value determines the NixOS release with which your system is
  # to be compatible, in order to avoid breaking some software such as
  # database servers. You should change this only after NixOS release
  # notes say you should.
  system.stateVersion = "19.03"; # Did you read the comment?

  programs.zsh.enable = true;

  users.extraUsers = [
  {
    name = "aim";
    uid = 1000;
    group = "users";
    extraGroups = [ "wheel" "networkmanager" "share" ];
    description = "Andrew McDermott";
    home = "/home/aim";
    shell = "/run/current-system/sw/bin/zsh";
  }
  ];

  users.extraGroups = [
  {
    name = "share";
    gid = 1001;
  }
  ];

  hardware.trackpoint = {
    enable = true;
    sensitivity = 230;
    speed = 250;
    device = "TPPS/2 IBM TrackPoint";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.forwardX11 = true;
}
