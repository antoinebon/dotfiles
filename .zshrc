# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/abon/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias fzf=~/.fzf/bin/fzf
#

export PROJECT_HOME=/home/abon/devel
# export PYTHONPATH=$PYTHONPATH:.:/home/abon/devel:/home/abon/source
# export PYTHONPATH=$PYTHONPATH:/home/abon/source/models/research/slim
# export PYTHONPATH=$PYTHONPATH:/home/abon/source/models/research/attention_ocr/python/datasets
# export PYTHONPATH=$PYTHONPATH:.:/home/abon/devel
# export PYTHONPATH=.:/home/abon/devel
# export PYTHONPATH=

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=/home/abon/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export VISUAL=nvim
export EDITOR=nvim

alias vi=nvim
setxkbmap fr
export PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/cuda-8.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:$HOME/bin
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/lib/cudnn-7.0/lib64:/usr/local/cuda-9.0:/usr/local/lib/cudnn-7.0
export JAVA_HOME=/usr/bin/java
export PYTHONPATH=/home/abon/source


# For tmux command history
## avoid duplicates..
# export HISTCONTROL=ignoredups:erasedups
## append history entries..
# shopt -s histappend
## After each command, save and reload history
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# export PROMPT_COMMAND="history -a; history -c; $PROMPT_COMMAND"


# Custom Functions
cfiles () {
    ls -1 $1 | wc -l
}

replace_all () {
    dir=$1
    pattern=$2
    search_string=$3
    replace_string=$4
    find ${dir} -name "${pattern}" -exec sed -i "s/${search_string}/${replace_string}/g" {} \;
}

mvl () {
    dir=$1
    pattern=$2
    dest=$3
    # find "$1" -name "'$2'" -exec mv {} "$3" \;
    find ${dir} -name "${pattern}" -print0 | xargs -0 -I files mv files ${dest}
    # find "$1" -name "'$2'" | xargs mv --target-directory="$3"
    # echo "'$1'" "$2"
    # find "$1" -name "'$2'" -exec echo {} \;
    # find "$2" | grep "$1" | xargs mv "$3"
}
