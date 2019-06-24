# Linux/Ubuntu

# sudo apt-get install bash-completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

export PLANTUML_LIMIT_SIZE=8192

function find-pr() {
  local parent=$2||'master'
  git log $1..$2 --merges --ancestry-path --reverse --oneline | head -n1
}

function find-pr-open() {
  local pr="$(find-pr $1 $2 | awk '{print substr($5, 2)}')"
  local repo="$(git config --get remote.origin.url | sed 's/git@github.com://' | sed 's/\.git$//')"
  open "https://github.com/${repo}/pull/${pr}"
}
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "
