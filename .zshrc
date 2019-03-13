# IDC, first thing first disable C-s, teletypes are gone
stty -ixon

source ~/.config/.zsh/antigen.zsh

# From the oh-my-zsh's library.
antigen use oh-my-zsh

# All-around stuff
antigen bundle vi-mode
antigen bundle git
antigen bundle heroku
antigen bundle command-not-found
antigen bundle docker

# Python stuff
antigen bundle ansible
antigen bundle python
antigen bundle pip
antigen bundle django
antigen bundle gangleri/pipenv

# JS
antigne bundle npm
antigne bundle yarn

# Syntax highlighting.
antigen bundle zsh-users/zsh-syntax-highlighting

# fish-like autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# more autocompletions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# stop relaying on /etc/profile
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

alias v=nvim vi=nvim vim=nvim
alias p=python3
