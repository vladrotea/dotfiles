# IDC, first thing first disable C-s, teletypes are gone
stty -ixon

source ~/.config/bin/antigen.zsh

# From the oh-my-zsh's library.
antigen use oh-my-zsh

# All-around stuff
antigen bundle vi-mode
antigen bundle git
antigen bundle heroku
antigen bundle command-not-found

# Python stuff
antigen bundle python
antigen bundle pip
antigen bundle django
antigen bundle docker

# Syntax highlighting.
antigen bundle zsh-users/zsh-syntax-highlighting

# fish-like autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
