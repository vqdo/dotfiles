export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=dxFxCxDxBxegedabagaced
alias ls='ls -GFh'

export PATH=/bin:/sbin:/usr/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:$PATH
export GOPATH=$HOME/go/workspace
export EDITOR='atom'
export REDIS_HOST="localhost:6379"


export NVM_DIR="/Users/victoriado/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local gitcolour="$CYAN"
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local gitcolour="$YELLOW"
        else
            local gitcolour="$GREEN"
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
	if [ -n "$branch" ]; then
	    echo "$gitcolour $branch \n";
	fi
    fi
}

# define colors
LBLUE='\[\e[0;36m\]'
BLUE='\[\e[0;34m\]'
PURPLE='\[\e[0;35m\]'
GREEN='\[\e[0;32m\]'
ORANGE='\[\e[0;33m\]'
YELLOW='\e[0;37m\]'
PINK='\[\e[0;91m\]'
BLACK="\[\e[0;38m\]"
CYAN="\[\e[0;96m\]"
function _prompt_command() {
    PS1="$PINK\u $PURPLE\w `_git_prompt`$PINK>> $BLACK"
}
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; _prompt_command }"

source ~/.profile
