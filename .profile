#
# Copyright (c) 2011 by Adam Leventhal.
# All right reserved.
#

PATH=/usr/sbin:$PATH

[[ -f ~/.profile.local ]] && . ~/.profile.local

PATH=~/bin:/usr/local/bin:$PATH

export PAGER=less

#
# A calculator thing that I enjoy...
#
function =
{
	echo $* | tr , \\012 | tr x '*' | bc -l
}

function _git_complete
{
	local githome=$(which git)
	local gitcore=${githome%/bin/git}/libexec/git-core
	local cur="${COMP_WORDS[COMP_CWORD]}"
	local prev="${COMP_WORDS[COMP_CWORD-1]}"
	local opts

	COMPREPLY=()

	# XXX account for flags
	case $prev in
	git)
		COMPREPLY=( $(/bin/ls -1 $gitcore/git-$cur* | \
		    sed -n 's/.*git-\(.*\)/\1/p' | grep -v -- --) )
		;;
	commit)
		opts="-a -m --all --reset-author"
		COMPREPLY=( $(compgen -W "$opts" -- $cur) )
		;;
	esac
}

#
# Function that is invoked every time we print the prompt. This is where we can
# do lightweight checks and update environment variables.
#
function pre_prompt
{
	GITHEAD=$(git rev-parse --show-toplevel 2>/dev/null) && \
	    export GITHEAD || unset GITHEAD
}

PROMPT_COMMAND=pre_prompt

PS1='\[\e[7m\]\h\[\e[0m\e[1m\] ${PWD} \[\e[0m\]\$ '

# complete -F _git_complete git

alias ls='ls -F'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias githead='cd $(git rev-parse --show-toplevel)'
