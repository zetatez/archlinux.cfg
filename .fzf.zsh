# FZF

# PATH
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'         # brew install fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
export FZF_COMPLETION_TRIGGER='\'

# auto-completion
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# key bindings
source ~/macos.cfg/.fzf-key-bindings.zsh

