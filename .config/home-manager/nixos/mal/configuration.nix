***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***: ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

  nixpkgs = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
  ***REMOVED***

    config = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
  in ***REMOVED***
    settings = ***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***

    registry = lib.mapAttrs(_: flake: ***REMOVED***inherit flake;***REMOVED***) flakeInputs;
    nixPath = lib.mapAttrsToList(n: _: "$***REMOVED***n***REMOVED***=flake:$***REMOVED***n***REMOVED***") flakeInputs;
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED*** console = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED*** services.pipewire = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***

***REMOVED***
  users.users.tyler = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED*** programs.gnupg.agent = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***

***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED*** Most users should NEVER change this value after the initial install, for any reason,
***REMOVED*** even if you've upgraded your system to a new NixOS release.
***REMOVED***
***REMOVED*** This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
***REMOVED*** so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
***REMOVED*** to actually do that.
***REMOVED***
***REMOVED*** This value being lower than the current NixOS release does NOT mean your system is
***REMOVED*** out of date, out of support, or vulnerable.
***REMOVED***
***REMOVED*** Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
***REMOVED*** and migrated your data accordingly.
***REMOVED***
***REMOVED*** For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
***REMOVED***
***REMOVED***
