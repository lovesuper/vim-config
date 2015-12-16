alias rmpyc="find . -type f -name '*.pyc'  | xargs rm -f"
alias rmrej="find . -type f -name '*.rej'  | xargs rm -f"
alias rmorig="find . -type f -name '*.orig'| xargs rm -f"
alias rmall="rmpyc && rmorig && rmrej"

PYTHONDONTWRITEBYTECODE=True

export PS1='\u@\h:\w\n\$ '
export PYTHONDONTWRITEBYTECODE
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR="vim"

