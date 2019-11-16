# Load environment-specific rc file first
if [ -f ".zshrc.$(uname)" ]; then
    source ".zshrc.$(uname)"
fi

# Command aliases from this line
#
## git alias
alias gst='git status'
alias gaa='git add'
alias gc-b='git checkout -b'
alias gc-m='git commit -m'
alias gl="git log --oneline --graph --decorate"
alias gp='git push'

## zsh alias
alias sz="source ~/.zshrc"
alias vz="vim ~/.zshrc"

## tmux alias
### send buffer of tmux to user
alias tmux-copy="tmux save-buffer - | pbcopy"

### hack pbcopy
if [ $(uname) = "Linux" ]; then
    # note:: xsel required. run `sudo apt-get install xsel`
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
elif [ $(uname) = "Darwin" ] && [ -n "$TMUX" ]; then
    alias pbcopy="reattach-to-user-namespace pbcopy"
fi

## other alias
alias v="vim"
alias c="clear"

# Command aliases from this line

# Environmental variables from this line
export EDITOR='vim'

# Environmental variables to this line
