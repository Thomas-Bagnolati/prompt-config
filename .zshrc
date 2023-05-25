# -------------------------------
#           ZshConfig           
# -------------------------------
                                
# Config ------------------->
zstyle ':omz:update' mode auto          # Auto update zsh


# Install ---------------------->
export ZSH="$HOME/.oh-my-zsh"           # Oh-my-zsh
export PATH=/opt/homebrew/bin:$PATH     # Brew


# Theme ------------------------>
ZSH_THEME="refined"


# Plugins ---------------------->
plugins=(
    git 
    git-flow-completion
    zsh-autosuggestions
    git vi-mode
    zsh-vi-mode
)

# Zsh autosuggestion
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Zsh vi mode
ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL     # Start with normal mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj         # remap escape insert mode to jj
ZVM_VI_HIGHLIGHT_BACKGROUND=#3b5070     # selection background
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold        # bold on selection


# Alias ------------------------>
# Use NeoVim by default
alias vim="nvim"
alias vi="nvim"

# Easy Edit files
alias ezsh="vim ~/.zshrc"
alias evim="vim ~/.vimrc"
alias eideavim="vim ~/.ideavimrc"
alias envim="vim ~/.config/nvim/init.vim"

# Easy source zsh
alias sourcezsh="source ~/.zshrc"


# Before init ------------------>
# Print neofetch
neofetch

# Source zsh after all
source $ZSH/oh-my-zsh.sh



#
##
### Makix - 2023.05.24
