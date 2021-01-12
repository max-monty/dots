source .bashrc

# ENVIORNMENT VARIABLES 
    export PATH="$PATH:$HOME/packages/flutter/bin"
    export NOTESPATH="/Users/maxmontgomery/documents/notes"
    export NOTESCRIPT="/Users/maxmontgomery/projects/notes"
    export EDITOR="vim"
    
# ALIASES
    ## programs
    alias python=/usr/local/bin/python3
    alias ruby=/usr/local/opt/ruby/bin/ruby
    alias vim=/usr/local/bin/vim
    ## shortcuts
    alias vrc="vim $HOME/.vimrc"
    alias cdh="cd $HOME"
    alias vbp="vim $HOME/.bash_profile"
    alias sbp="source $HOME/.bash_profile"
    alias nb="newsboat"
    ## notes
    alias scratch="notes scratch"
    alias journal="notes journal"
    alias stack="notes stack"
    alias push="notes push"
    alias pop="notes pop"
    alias search="notes search"
    alias pd="notes push -d"
    alias ppd="notes pop -d"
    ## git
    alias ga="git add ."
    alias gp="git push"
    alias gpl="git pull"
   
# MISCELLANEOUS
    set -o vi # set readline editor to vi

# FUNCTIONS
    ## git
    gpsu() {
        branch=$(git branch --show-current)
        remote=$(git remote -v | awk 'NR==1{print $1}') 
        git push -u $remote $branch
    }
    ginit() {
        base=$(basename "$PWD")
        curl -u "max-monty:$GITHUB" https://api.github.com/user/repos -d '{"name":"'$base'", "private":true}'
        git init
        touch README.md
        git add .
        git commit -am "init commit"
        git branch -M master
        git remote add origin git@github.com:max-monty/$base.git
        git push -u origin master
    }
    gc() { 
        message="\""$@"\""
        echo $message
        echo git commit -am $message 
    }

