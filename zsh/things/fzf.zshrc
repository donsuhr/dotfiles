FZF_DEFAULT_OPTS=
FZF_DEFAULT_OPTS+=" --ansi" 
FZF_DEFAULT_OPTS+=" --preview-window 'right:60%'" 
FZF_DEFAULT_OPTS+=" --bind up:preview-up,down:preview-down" 
FZF_DEFAULT_OPTS+=" --preview 'bat --color=always --italic-text=always --style=numbers,changes,header --line-range :300 {} '"
export FZF_DEFAULT_OPTS

fzf_grep_edit(){
  # https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
  if [[ $# == 0 ]]; then
    echo 'Error: search term was not provided.'
    return
  fi
  local match=$(
  rg --column --line-number --no-heading --color=never --smart-case  $@ |
    fzf --delimiter : \
    --preview "~/dotfiles/zsh/fzf-bat-preview.sh {1} {2}"
  )
  local file=$(echo "$match" | cut -d':' -f1)
  if [[ -n $file ]]; then
    $EDITOR "$file" +$(echo "$match" | cut -d':' -f2)
  fi
}

alias fzfs='fzf_grep_edit'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
