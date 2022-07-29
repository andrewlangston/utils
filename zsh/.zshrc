# ZSH plugin to search command history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZSH plugin for autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH Starship plugin
eval "$(starship init zsh)"
