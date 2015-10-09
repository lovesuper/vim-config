if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PS1='\u@\h:\w\n\$ '

alias rmpyc="find . -type f -name '*.pyc'  | xargs rm -f"
alias rmrej="find . -type f -name '*.rej'  | xargs rm -f"
alias rmorig="find . -type f -name '*.orig'| xargs rm -f"
alias rmall="rmpyc && rmorig && rmrej"

PYTHONDONTWRITEBYTECODE=True
export PYTHONDONTWRITEBYTECODE

# from osxdaily.com
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# for bash autocompletion
if [ -f $(brew --prefix)/etc/bash_completion  ]; then
    . $(brew --prefix)/etc/bash_completion
fi
