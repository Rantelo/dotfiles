red="\[$(tput setaf 160)\]"
reset="\[$(tput sgr0)\]"

PS1="\nrantelo"
PS1+="${red}@${reset}"
PS1+="\w"
PS1+="${red}$\n${reset}"

export PS1
