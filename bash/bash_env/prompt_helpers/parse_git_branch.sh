# get current branch in git repo
function parse_git_branch() {
    COLOR=$1
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo -e " on \033[${COLOR}m${BRANCH}${STAT}\033[m"
	else
		echo ""
	fi
}

