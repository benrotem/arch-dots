#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Fancy prompt
function get_distro
{
	distro=$(cat /etc/os-release | grep -oP '(?<=^NAME=")[^"]+')

	if [ "$distro" != 'Arch Linux' ]; then
		flag="\001\e[94m\002[\001\e[95m\002$distro\001\e[94m\002]─\001\e[0m\002"
	fi

	echo -e "$flag"
}

function get_git_branch
{
	branch=$(git branch --show-current 2>/dev/null)
	
	if [ $branch ]; then
		flag="\001\e[94m\002─(\001\e[93m\002$branch\001\e[94m\002)\001\e[0m\002"
	fi

	echo -e "$flag"
}

function get_exit_code
{
	if [ $? -ne 0 ]; then
		flag="\001\e[94m\002─\001\e[91m\002❌\001\e[0m\002"
	fi

	echo -e "$flag"
}

PROMPT_COMMAND='exit_flag=$(get_exit_code); distro_flag=$(get_distro); git_flag=$(get_git_branch)'
PS1='\[\e[94m\]╭─$distro_flag\[\e[94m\](\[\e[93m\]\W\[\e[94m\])$git_flag$exit_flag\n\[\e[94m\]╰─ \[\e[96m\]\$\[\e[97m\] '

# Simple prompt for tty
if [ $TERM == 'linux' ]; then
	PS1='\[\e[97m\](\u@\h \W) \$ '
fi

# Aliases
alias dfgit='git --git-dir=$HOME/.dots.git --work-tree=$HOME'
alias ls='ls --color=auto --group-directories-first'
alias la='ls -A'
alias grep='grep --color=auto'
alias c='clear'
alias v='nvim'
