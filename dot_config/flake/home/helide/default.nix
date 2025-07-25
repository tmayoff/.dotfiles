{...}: {
  xdg.configFile."helide/yazi.toml" = {
    text = ''
      [manager]
      ratio = [0, 4, 0]
    
      [[input.prepend_keymap]]
      on   = "<Esc>"
      run  = "close"
      desc = "Cancel input"

      [opener]
      edit = [
        { run = '~/.config/helide/,yazi_opener.sh "$1"', desc = "Open File in helix" }
      ]
    '';
  };

  xdg.configFile."helide/keymap.toml" = {
    text = ''
      [[input.prepend_keymap]]
      on   = "<Esc>"
      run  = "close"
      desc = "Cancel input"
    '';
  };

  xdg.configFile."helide/,yazi_opener.sh" = {
    text = ''
      #!/usr/bin/env bash

      # Move focus to the next pane
      zellij action focus-next-pane

      # Get the running command in the current pane
      RUNNING_COMMAND=$(zellij action list-clients | awk 'NR==2 {print $3}')

      # Check if the command running in the current pane is helix (hx)
      # if echo "$RUNNING_COMMAND" | grep -q "hx$"; then
          # The current pane is running helix, use zellij actions to open the file
          zellij action write 27
          zellij action write-chars ":open $1"
          zellij action write 13
      # else
      #     # The current pane is not running helix, so open helix in a new pane
      #     zellij action new-pane
      #     sleep 0.3
      #     zellij action write-chars "hx $1"
      #     zellij action write 13

      #     # warning from before I got it working
      #     # zellij action new-pane --name "WARNING" -- "echo" "please open helix in a pane right next to the sidebar (to the right of it) using 'hx path_to_file'"
      # fi
    '';
    executable = true;
  };

  xdg.configFile."helide/zellij_layout" = {
    text = ''
      layout {
      	default_tab_template {
              pane size=1 borderless=true {
                  plugin location="zellij:tab-bar"
              }
              children
              pane size=2 borderless=true {
                  plugin location="zellij:status-bar"
              }
          }

      	tab name="IDE" {
      		pane split_direction="vertical" {
      			pane name="sidebar" {
              command "env"
              args "YAZI_CONFIG_HOME=~/.config/helide" "yazi"
              size "15%"
            }
      			pane command="hx"
      		}
      	}

      	tab name="shell"
      }
    '';
  };

  home.shellAliases ={
    helide = "zellij -l ~/.config/helide/zellij_layout";
  };
}
