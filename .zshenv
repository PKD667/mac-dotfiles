export SHELL_SESSIONS_DISABLE=1

# history settings
export HISTFILE="/Users/jdh/.config/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

export PATH="/opt/bin:$PATH"

# .zshrc, etc. are located here
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
    export ZDOTDIR=~/.config/zsh
fi

export EDITOR="nvim"

