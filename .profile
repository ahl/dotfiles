#
# Copyright 2011, 2017 Adam Leventhal. All right reserved.
#

PATH=/usr/sbin:$PATH

# export GO15VENDOREXPERIMENT=1 # don't think I need this any more
export GOPATH=~/gosrc

PATH=~/bin:/usr/local/bin:$GOPATH/bin:$PATH

[[ -f ~/.profile.local ]] && . ~/.profile.local


export PAGER=less

#
# A calculator thing that I enjoy...
#
function =
{
	echo $* | tr , \\012 | tr x '*' | bc -l
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

#PROMPT_COMMAND=pre_prompt

PS1='\[\e[7m\]\h\[\e[0m\e[1m\] ${PWD} \[\e[0m\]\$ '

alias ls='ls -F'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias rmorg='/bin/rm *.org'
alias rrmorg='find . -name \*.org | xargs rm'

alias githead='cd $(git rev-parse --show-toplevel)'

# Color less
export LESS=RFX

# Color jq
alias jq='jq -C'

function aws-profile {
	export AWS_PROFILE=$1
}
. "$HOME/.cargo/env"
