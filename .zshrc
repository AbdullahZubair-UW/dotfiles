# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# General Paths
export ZSH="$HOME/.oh-my-zsh"
### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode

export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH="$PATH:'yarn global bin'"

# For Dotfiles bare stuff.
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


#################### OH MY ZSH STUFF  ################################
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  copyfile
  cp
  ubuntu
  copypath
  copyfile
  copybuffer
  fd
  dirhistory
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# For a full list of active aliases, run `alias`.
#
# Example aliases

# Git
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'  # 'status' is protected name so using 'stat' instead

# Changing "ls" to "exa"
alias ls='lsd -al --color=always --group-directories-first' # my preferred listing
alias la='lsd -a --color=always --group-directories-first'  # all files and dirs
alias ll='lsd -l --color=always --group-directories-first'  # long format
alias lt='lsd -aT --color=always --group-directories-first' # tree listing
alias l.='lsd -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i'

# vim and emacs
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"


#FZF - Fuzzy Finder Functions
. ~/z.sh

j() {
    [ $# -gt 0 ] && z "$*" && return
    cd "$(z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

xset r rate 150 100
xmodmap ~/.Xmodmap

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

