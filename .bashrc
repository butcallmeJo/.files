#
# Script Vars
#

# Colors and stuffs
LIGHTCOLOR="\\e[0;"
DARKCOLOR="\\e[1;"
BLUE="34m"
GREEN="32m"
CYAN="36m"
RED="31m"
PURPLE="35m"
YELLOW="33m"
ENDCOLOR="\\e[0m"

bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# 
# Aliases
# 

# Safeguarding rm, cp, and mv
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Redirections
alias dev='cd /mnt/c/Users/josquin.gaillard/Dev'
alias win='cd /mnt/c/Users/josquin.gaillard'
alias work='cd /mnt/c/Users/josquin.gaillard/Dev/ClearDATA'
alias ..='cd ..'
alias ...='cd ../..'

# Python 3 default
alias python='python3'
alias pip='pip3'

# Misc
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh' # Makes a more readable output.
alias df='df -kTh'

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias l='ls --color=auto'
alias ls='ls -hG --color=auto'
alias la='ls -la --color=auto'
alias lx='ls -lXB --color=auto'  #  Sort by extension.
alias lk='ls -lSr --color=auto'  #  Sort by size, biggest last.
alias lt='ls -ltr --color=auto'  #  Sort by date, most recent last.
alias lc='ls -ltcr --color=auto' #  Sort by/show change time,most recent last.
alias lu='ls -ltur --color=auto' #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
# alias ll="ls -lv --group-directories-first"
# alias lm='ll |more'        #  Pipe through 'more'
# alias lr='ll -R'           #  Recursive ls.
# alias la='ll -A'           #  Show hidden files.
# alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

# 
# Exports
# 

parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

__pwd_trim() {
	OLDIFS=$IFS
	export IFS="/"
	read -r -a pwd_arr <<<"$PWD"
	read -r -a home_arr <<<"$HOME"
	pwd_arr_len=${#pwd_arr[@]}
	for index in "${!pwd_arr[@]}"; do
		if [ "${pwd_arr[index]}" == "${home_arr[0]}" ] && [ "${pwd_arr[index+1]}" == "${home_arr[1]}" ] && [ "${pwd_arr[index+2]}" == "${home_arr[2]}" ]; then
			printf "$HOME/"
		elif [ "${pwd_arr[index]}" == "${home_arr[index]}" ]; then
			continue
		elif [ "${pwd_arr[index]}" == "${pwd_arr[pwd_arr_len-1]}" ]; then
			dir=${pwd_arr[index]}
			printf "$dir"
		elif [ "${pwd_arr[index]}" == "${pwd_arr[pwd_arr_len-2]}" ]; then
			dir=${pwd_arr[index]}
			printf "$dir/"
		elif [ "${pwd_arr[index]}" == "${pwd_arr[pwd_arr_len-3]}" ] || [ "${pwd_arr[index]}" == "${pwd_arr[pwd_arr_len-4]}" ]; then
			firstletters=${pwd_arr[index]:0:2}
			printf "$firstletters/"
		else
			printf "../"
		fi
	done
	IFS=$OLDIFS
}

# source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# PS1
# export PS1='$(echo $(dirname $(echo \w | sed "s;$HOME;~;"))/ |sed -e "s;\(/\.\?.\)[^/]*;\1;g" -e "s;/h/s;~;" -e "s;\./;;")\W\$ '
export PS1="\[$DARKCOLOR$YELLOW\]\$(__pwd_trim)\[$ENDCOLOR\]\[$LIGHTCOLOR$PURPLE\]\$(__git_ps1) :\[$ENDCOLOR\] \[$LIGHTCOLOR$GREEN\]"
# preexec() { echo -ne "\e[0m"; } 
trap 'tput sgr0' DEBUG

# set default editor
# export EDITOR=/usr/bin/emacs

# 
# Go env stuff
# 
export GOROOT=/usr/lib/go-1.6
export GOPATH=/mnt/c/Users/josquin.gaillard/Dev/go
# export PATH=$PATH:/Users/josquingaillard/work/protoc-3.2.0rc2-osx-x86_64/
# export PATH=$PATH:$GOPATH/bin
