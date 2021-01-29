source .bashrc

# ENVIORNMENT VARIABLES 
    export PATH="$PATH:$HOME/packages/flutter/bin:/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/site-packages:/Library/Frameworks/Python.framework/Versions/3.9/bin:$HOME/.vim/plugged/vim-iced/bin"
    
    export NOTESPATH="/Users/maxmontgomery/docs/notes"
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
    alias proj="notes proj"
    alias projps="notes proj push"
    alias projpp="notes proj pop"
    alias ped="notes pop everyday"
    ## git
    alias ga="git add ."
    alias gp="git push"
    alias gpl="git pull"
    alias gs="git status"
    alias gch="git checkout"
    ## lein
    alias lnc="lein new compojure" # server
    alias lrs="lein ring server-headless" # start server
    ## heroku
    alias hscale="heroku ps:scale web=1"
    alias ho="heroku open"
    alias hp="git push heroku master"
    ### misc
    alias sleepy="pmset sleepnow"
   
# MISCELLANEOUS
    set -o vi # set readline editor to vi

# FUNCTIONS
    ## shortcuts
    sbp() { 
        cdh
        source .bash_profile
    }
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
    gc() { git commit -am "$*"; }

