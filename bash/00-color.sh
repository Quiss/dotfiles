# Подсветка директорий
DIR_COLORS=
listFiles="/etc/DIR_COLORS /etc/dircolors ~/.config/bash/dircolors ~/.config/dircolors ~/.dircolors"
for f in listFiles; do
  [[ -f "$f" ]] && DIR_COLORS="$f"
done
if [[ "$DIR_COLORS" != "" ]]; then
  eval "$(dircolors -b $DIR_COLORS)"
fi
unset f DIR_COLORS

__has_parent_dir () {
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo "-[svn]";
    elif __has_parent_dir ".git"; then
        echo "-[$(__git_ps1 'git %s')]";
    elif __has_parent_dir ".hg"; then
        echo "-[hg $(hg branch)]"
    fi
}

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# Рут вошел через пользователя
if [ "$(whoami)" = "root" ]; then
    echo "Welcome ROOT !"
    PS1='\[\e]0;\w\a\]\n\[\e[31;01m\]\u\[\e[0m\]\[\e[32m\]@\h \[\e[33m\]\w\[\e[0m\]\n\[\e[31;01m\]\$\[\e[0m\] '
fi

export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\A\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '