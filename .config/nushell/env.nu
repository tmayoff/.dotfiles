# Nushell Environment Config File
#
# version = "0.85.0"

def create_left_prompt [] ***REMOVED***
    let home =  $nu.home-path

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let path_color = (if (is-admin) ***REMOVED*** ansi red_bold ***REMOVED*** else ***REMOVED*** ansi green_bold ***REMOVED***)
    let separator_color = (if (is-admin) ***REMOVED*** ansi light_red_bold ***REMOVED*** else ***REMOVED*** ansi light_green_bold ***REMOVED***)
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)/($path_color)"
***REMOVED***

def create_right_prompt [] ***REMOVED***
  ***REMOVED*** create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X %p') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)$***REMOVED***1***REMOVED***(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)$***REMOVED***1***REMOVED***")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) ***REMOVED***([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    ***REMOVED*** else ***REMOVED*** "" ***REMOVED***

    ([$last_exit_code, (char space), $time_segment] | str join)
***REMOVED***

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = ***REMOVED***|| create_left_prompt ***REMOVED***
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = ***REMOVED***|| create_right_prompt ***REMOVED***

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ***REMOVED***|| "> " ***REMOVED***
$env.PROMPT_INDICATOR_VI_INSERT = ***REMOVED***|| ": " ***REMOVED***
$env.PROMPT_INDICATOR_VI_NORMAL = ***REMOVED***|| "> " ***REMOVED***
$env.PROMPT_MULTILINE_INDICATOR = ***REMOVED***|| "::: " ***REMOVED***

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = ***REMOVED***
    "PATH": ***REMOVED***
        from_string: ***REMOVED*** |s| $s | split row (char esep) | path expand --no-symlink ***REMOVED***
        to_string: ***REMOVED*** |v| $v | path expand --no-symlink | str join (char esep) ***REMOVED***
    ***REMOVED***
    "Path": ***REMOVED***
        from_string: ***REMOVED*** |s| $s | split row (char esep) | path expand --no-symlink ***REMOVED***
        to_string: ***REMOVED*** |v| $v | path expand --no-symlink | str join (char esep) ***REMOVED***
    ***REMOVED***
***REMOVED***

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
  ***REMOVED*** FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
  ***REMOVED*** FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

$env.EDITOR = "vim"
$env.DEBEMAIL = "tyler@tylermayoff.com"

$env.XDG_DATA_HOME = $"($env.HOME)/.local/share"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.XDG_STATE_HOME = $"($env.HOME)/.local/state"
$env.XDG_CACHE_HOME = $"($env.HOME)/.cache"

$env.RUSTUP_HOME = $"($env.XDG_DATA_HOME)/rustup"
$env.CARGO_HOME = $"($env.XDG_DATA_HOME)/cargo"

$env.GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"

$env.PATH = ($env.PATH | split row (char esep) | prepend '.local/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.CARGO_HOME)/bin")


mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
