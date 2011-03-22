#
# Copyright (c) 2011 by Adam Leventhal.
# All right reserved.
#

export PATH=~/bin:/opt/local/bin:/opt/local/sbin:$PATH

#
# A calculator thing that I enjoy...
#
function =
{
	echo $* | tr , \\012 | bc -l
}

function _githead
{
	local dir=$PWD

	while [[ ! -d "$dir/.git" ]]; do
		if [[ "$dir" = "/" ]]; then
			return 1
		fi

		dir=$(dirname $dir)
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
