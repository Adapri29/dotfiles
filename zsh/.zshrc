# --- Historial -----------------------------------------------------
HISTFILE=~/.config/zsh/zhistory  # la carpeta debe existir
HISTSIZE=5000                    # comandos en memoria por sesión
SAVEHIST=5000                    # comandos guardados en HISTFILE
setopt share_history             # historial compartido entre terminales
setopt hist_ignore_dups          # no guarda un comando igual al anterior

# --- Autocompletado ------------------------------------------------
autoload -Uz compinit && compinit    # completado con Tab
zstyle ':completion:*' menu select   # menú navegable con flechas

# --- fzf -----------------------------------------------------------
# Ctrl+R historial · Ctrl+T archivos · Alt+C cambiar de carpeta
source <(fzf --zsh)

# --- Prompt (Starship) ---------------------------------------------
export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml
eval "$(starship init zsh)"

# --- Alias ---------------------------------------------------------
alias cat="bat --theme=base16"                     # cat con resaltado de sintaxis
alias ls='eza --icons=always --color=always -a'    # con iconos, incluye ocultos
alias ll='eza -lag --icons=always --git'           # detallada + grupo + estado git
alias la='eza --icons=always --color=always -la'   # detallada con ocultos
alias lt='eza --tree --level=2 --icons=always'     # árbol de 2 niveles

# --- Plugins -------------------------------------------------------
# Sugerencias desde el historial (→ para aceptar)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Resaltado de sintaxis. Debe ir siempre al final del archivo.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
