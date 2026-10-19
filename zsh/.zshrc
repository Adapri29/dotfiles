#---------------------#
#       HISTORY       #
#---------------------#
HISTFILE=~/.config/zsh/zhistory
HITSIZE=5000
SAVEHIST=5000
setopt share_history
setopt hist_ignore_dups


#---------------------#
#    AUTO COMPLETE    #
#---------------------#
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

#---------------------#
#       PLUGINS       #
#---------------------#
source /usr/share/zsh/plugins/zsh-autosuggestions/autosugestions.zsh
source /usr/share/zsh/plugins/zsh-syntaxis-highlighting/zsh-syntaxis-highlighting.zsh

#---------------------#
#    SHELL PROMPT     #
#---------------------#
eval "$(starship init zsh)"
