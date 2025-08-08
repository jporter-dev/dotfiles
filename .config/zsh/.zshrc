# Shell aliases
alias cat="bat --style=plain"
alias ls="eza"
alias ll="ls -lag"
alias l="ls -lg"
alias grep="rg"
alias find="fd"
alias oo="open ."
alias tree="exa --tree"

# Docker aliases
alias docker="podman"
alias docker-compose="podman-compose"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcr="docker-compose run --rm"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dpsg="docker ps --format '{{.Names}}\t{{.ID}}' | grep -i"
alias dpsn="docker ps --format '{{.Names}}\t{{.ID}}'"
alias dpsp="docker ps --format '{{.Names}}\t{{.Ports}}\t{{.ID}}'"

# Git aliases
alias ga="git add"
alias gaa="git add ."
alias gaaa="git add --all"
alias gau="git add --update"
alias gb="git branch"
alias gbd="git branch --delete "
alias gc="git commit"
alias gcm="git commit --message"
alias gcf="git commit --fixup"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gda="git diff HEAD"
alias gi="git init"
alias glg="git log --graph --oneline --decorate --all"
alias gld="git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --all"
alias glf="git log -p $1"
alias gm="git merge --no-ff"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gl="git pull"
alias glr="git pull --rebase"
alias gp="git push"
alias gpsup="git push --set-upstream origin"
alias gr="git rebase"
alias gs="git status"
alias gss="git status --short"
alias gst="git stash"
alias gsta="git stash apply"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gsts="git stash save"

# Environment variables
export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"

# macOS specific configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
  export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
  export LIBRARY_PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"
fi

# Initialize fnm
if command -v fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

# Initialize zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# Initialize starship prompt
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Enable autosuggestions
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Enable syntax highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
