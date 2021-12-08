# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files source by it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v4/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
zstyle ':z4h:'                auto-update      'ask'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:'                auto-update-days '10'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey'         keyboard         'pc'
# When fzf menu opens on TAB, another TAB moves the cursor down ('tab:down')
# or accepts the selection and triggers another TAB-completion ('tab:repeat')?
zstyle ':z4h:fzf-complete'    fzf-bindings     'tab:down'
# When fzf menu opens on Alt+Down, TAB moves the cursor down ('tab:down')
# or accepts the selection and triggers another Alt+Down ('tab:repeat')?
zstyle ':z4h:cd-down'         fzf-bindings     'tab:down'
# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char     'accept'

# Send these files over to the remote host when connecting over ssh.
# Multiple files can be listed here.
#zstyle ':z4h:ssh:*'           send-extra-files '~/.sterm2_shell_integration.zsh'

# Disable automatic teleportation of z4h over ssh when connecting to some-host.
# This makes `ssh some-host` equivalent to `command ssh some-host`.
zstyle ':z4h:ssh:lindev'		passthrough      'no'
zstyle ':z4h:ssh:lindev2'		passthrough      'no'
zstyle ':z4h:ssh:lindev-noproxy'	passthrough      'no'
zstyle ':z4h:ssh:lindev-proxy'	passthrough      'no'
zstyle ':z4h:ssh:*'  	 		passthrough      'yes'

# Move the cursor to the end when Up/Down fetches a command from history?
zstyle ':zle:up-line-or-beginning-search'   leave-cursor 'yes'
zstyle ':zle:down-line-or-beginning-search' leave-cursor 'yes'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
#z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return


# this makes forward-word jump to next non alphanumeric char instead of any 
# non whitespace char
WORDCHARS=""

# Export environment variables.
export LANG=en_US.UTF-8
export DOCKER_CONFIG=~/.config/docker
export GPG_TTY=$TTY
export BROWSER=firefox
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_CACHE_HOME=~/.cache
export MANPAGER='nvim +Man!'
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE="${XDG_DATA_HOME}"/zsh/zsh_history
export SDKMAN_DIR="/home/samir/.local/share/sdkman"
export PSQLRC="/home/samir/.config/psqlrc"
export _JAVA_AWT_WM_NONREPARENTING=1
export UNIT_TEST_PROPERTIES=~/svn/unit-test.properties

# Additional settings
setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt autocd 			# switch directories without cd prefix
setopt appendhistory

#bindkey -e
export KEYTIMEOUT=5

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
#z4h source $Z4H/ohmyzsh/ohmyzsh/lib/diagnostics.zsh
#z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/emoji-clock/emoji-clock.plugin.zsh
#fpath+=($Z4H/ohmyzsh/ohmyzsh/plugins/supervisor)

# Source additional local files if they exist.
z4h source /usr/share/LS_COLORS/dircolors.sh
z4h source ~/.local/share/sdkman/bin/sdkman-init.sh

# Define key bindings.
# bind keys to accept a suggestion and accept only a 'word'
z4h bindkey z4h-forward-word		Ctrl+L
z4h bindkey z4h-backward-word		Ctrl+H
#bindkey '^M' autosuggest-accept
#bindkey '^i' autosuggest-accept
z4h bindkey z4h-backward-kill-word	Ctrl+J
z4h bindkey z4h-kill-word		Ctrl+K
# this does not work because ctrl/shift+enter produce the same as 
# enter being pressed alone....
# bindkey '^M' autosuggest-execute

#z4h bindkey z4h-backward-kill-word  Ctrl+Backspace Ctrl+H
#z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

z4h bindkey undo Ctrl+/  # undo the last command line change
z4h bindkey redo Alt+/   # redo the last undone command line change

z4h bindkey z4h-cd-back    Alt+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Alt+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Alt+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Alt+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Replace `ssh` with `z4h ssh` to automatically teleport z4h to remote hosts.
function ssh() { z4h ssh "$@" }

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -n $z4h_win_home ]] && hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"
alias update='sudo pacman -Syu && yay -Sua'
alias hg='history 0 | grep' # without the 0 history does not show all items
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias -g G=' | grep -i'
alias ll='ls -althF'
alias findall='sudo find / -name'
alias cd..='cd ..'
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias v='nvim'
alias g='goneovim'
alias sv='sudo nvim'
alias vim='nvim'
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"
alias mvnd="mvnd -Dmvnd.daemonStorage=$XDG_CONFIG_HOME/mvnd -gs $XDG_CONFIG_HOME/maven/settings.xml"
#alias docker="docker --config ~/.config/docker"

alias cdeproxy-on='command ssh -fN lindev-proxy'
alias cdeproxy-check='command ssh -O check lindev-proxy'
alias cdeproxy-off='command ssh -O exit lindev-proxy'
# Add flags to existing aliases.
#alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#[[ -s "/home/samir/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "/home/samir/.local/share/sdkman/bin/sdkman-init.sh"
