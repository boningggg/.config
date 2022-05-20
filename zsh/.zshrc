########## Alias ##########
alias ll='ls -lAF'

########## Color ##########
# ls color
export CLICOLOR=1
# Prompt Theme - Pure : brew install pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color 252
zstyle :prompt:pure:git:branch color green
zstyle :prompt:pure:prompt:success color green
# turn on git stash status
zstyle :prompt:pure:git:stash show yes
prompt pure

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
