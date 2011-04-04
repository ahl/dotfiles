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
	echo $* | tr , \\012 | bc -l
}

#
# Find the root of our git repository.
#
function _githead
{
	local dir=$PWD

	while [[ ! -d "$dir/.git" ]]; do
		if [[ "$dir" = "/" ]]; then
			return 1
		fi

		dir=$(dirname "$dir")
	done

	echo $dir
}

function githead
{
	local dir

	dir=$(_githead)

	if [[ $? -ne 0 ]]; then
		echo "You are not in a git repository"
		return 1
	fi

	cd $dir
}

#
# Function that is invoked every time we print the prompt. This is where we can
# do lightweight checks and update environment variables.
#
function pre_prompt
{
	GITHEAD=$(_githead) && export GITHEAD || unset GITHEAD
}

PROMPT_COMMAND=pre_prompt

PS1='\[\e[7m\]\h\[\e[0m\e[1m\] ${PWD} \[\e[0m\]\$ '

alias ls='ls -F'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
