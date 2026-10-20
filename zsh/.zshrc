#---------------------#
#       HISTORY       #
#---------------------#
HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000
setopt share_history
setopt hist_ignore_dups


#---------------------#
#    AUTO COMPLETE    #
#---------------------#
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#808080'
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

#---------------------#
#       PLUGINS       #
#---------------------#
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#---------------------#
#    SHELL PROMPT     #
#---------------------#
export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml
eval "$(starship init zsh)"

#---------------------#
#	 ALIAS        #
#---------------------#
alias cat="bat --theme=base16"
alias ls='eza --icons=always --color=always -a'
alias ll='eza --icons=always --color=always -la' 
