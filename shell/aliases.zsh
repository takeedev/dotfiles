#git
alias gs="git status"
alias gsh="git status --short"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git pull"
alias gpr="git pull --rebase"
alias gup="git pull --rebase --autostash"
alias gb="git branch"
alias gco="git checkout"
alias gsw="git switch"
alias gcb="git checkout -b"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias glog="git log --oneline --graph --decorate"
alias gll="git log --oneline --graph --decorate --all"
alias gm="git merge"
alias grb="git rebase"
alias gcp="git cherry-pick"
alias gst="git stash"
alias gstp="git stash pop"
alias gstl="git stash list"
alias grst="git restore --staged"
alias grh="git reset --hard"

#list file
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

#Navigate file
alias home="cd ~"
alias desk="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias docs="cd ~/Documents"
alias projects="cd ~/Public/project"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"
alias mkdirp="mkdir -p"
alias reload="source ~/.zshrc"
alias path='printf "%s\n" ${(ps.:.)PATH}'

#IDE
idea() {
  local target="${1:-.}"

  case "$(uname -s)" in
    Darwin*)
      open -na "IntelliJ IDEA.app" --args "$target"
      ;;
    Linux*)
      if whence -p idea >/dev/null 2>&1; then
        command idea "$target"
      elif whence -p intellij-idea-ultimate >/dev/null 2>&1; then
        intellij-idea-ultimate "$target"
      elif whence -p intellij-idea-community >/dev/null 2>&1; then
        intellij-idea-community "$target"
      else
        printf 'Error: IntelliJ IDEA command-line launcher not found. Add idea to PATH.\n' >&2
        return 1
      fi
      ;;
    MINGW*|MSYS*|CYGWIN*)
      if whence -p idea64.exe >/dev/null 2>&1; then
        idea64.exe "$target"
      elif whence -p idea.exe >/dev/null 2>&1; then
        idea.exe "$target"
      else
        printf 'Error: idea64.exe or idea.exe not found in PATH.\n' >&2
        return 1
      fi
      ;;
    *)
      printf 'Error: unsupported OS for IntelliJ IDEA launcher.\n' >&2
      return 1
      ;;
  esac
}
