export EDITOR=vim

if [ -d "$HOME/bin" ] ; then
    export PATH=$PATH:$HOME/bin
fi

# RUBY GEMS PATH FOR RAKE
export PATH=$PATH:/var/lib/gems/1.9.1/bin

# PIP BASH COMPLETION
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
    COMP_CWORD=$COMP_CWORD \
    PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

# RAKE COMPLETION 
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
    COMPREPLY=($(compgen -W "`rake -s -T 2>/dev/null | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
    return 0
}

complete -o default -o nospace -F _rakecomplete rake

# CUSTOM BASH PROMPT
 . ~/.bash_colors.sh

function set_git_branch {
    git_status="$(git status 2> /dev/null)"

    if [[ ${git_status} =~ "working directory clean" ]]; then
        state="$GREEN"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="$YELLOW"
    else
        state="$RED"
    fi

    return state
}

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

grb_git_prompt() {

    git_status="$(git status 2> /dev/null)"
     if [[ ${git_status} =~ "working directory clean" ]]; then
         state="$GREEN"
     elif [[ ${git_status} =~ "Changes to be committed" ]]; then
         state="$YELLOW"
     else
         state="$RED"
     fi 
               
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=$RED
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=$YELLOW
        else
            local COLOR=$GREEN
        fi
        local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)${NORMAL}"
        local GIT_PROMPT=`__git_ps1 "(${state}%s${NORMAL}|${SINCE_LAST_COMMIT})"`
        echo ${GIT_PROMPT}
    fi
}

PS1="\u@\h:\W\$(grb_git_prompt)\r\n$ "
