red="\[$(tput setaf 160)\]"
reset="\[$(tput sgr0)\]"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
  # if not found in /usr/local/etc, try the brew --prefix location
  [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
  . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
  PATH="$HOME/.okta/bin:$PATH"
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1/"
}
update_ps1() {
  PS1="\n${red}[${reset}$(date +%H:%M:%S)${red}]${reset} "
  PS1+="rantelo"
  PS1+="${red}@${reset}"
  PS1+="wizeline:\w"
  PS1+="\n${red}$ ${reset}"
}
