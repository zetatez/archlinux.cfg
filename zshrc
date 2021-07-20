#!/bin/zsh

# author: Lorenzo
#---------------------------------------------------
alias z="source ~/.zshrc"
alias vz="vim /etc/zshrc"
alias vs="vim /etc/fish/config.fish"
alias vv="vim ~/.vimrc"

# zsh behavior 
# ----------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export PAGER=less
set -o vi
TMOUT=

# comment with #
setopt interactivecomments

# prompt
autoload -U colors && colors
autoload -U promptinit
promptinit
# prompt -l
# prompt -p
# prompt walters
# PS1=$'\n F ☠\n'
PS1=$'\n%n@%m:%0~ # '
alias 0="PS1=$'\n%n@%m:%0~$ \n'"

# auto complete
autoload -Uz compinit && compinit 

# cli alias complete
setopt completealiases

# prompt show git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# remove dupliacte history
setopt HIST_IGNORE_DUPS
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# fish like
# ----------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# https://github.com/zsh-users/zsh-autosuggestions
# Key Bindings: This plugin provides a few widgets that you can use with bindkey:
#   - autosuggest-accept: Accepts the current suggestion.
#   - autosuggest-execute: Accepts and executes the current suggestion.
#   - autosuggest-clear: Clears the current suggestion.
#   - autosuggest-fetch: Fetches a suggestion (works even when suggestions are disabled).
#   - autosuggest-disable: Disables suggestions.
#   - autosuggest-enable: Re-enables suggestions.
#   - autosuggest-toggle: Toggles between enabled/disabled suggestions.
bindkey '^ ' autosuggest-accept      # ctrl + space, tab also works
bindkey '^k' autosuggest-clear       # ctrl + \
# bindkey '^\r' autosuggest-execute    # ctrl + return

# dir stack
# ----------------
# mkdir -p ~/.cache/zsh/dirs
# dirs -v
# cd -num
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
      dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
        [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
      print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
  }
DIRSTACKSIZE=30
setopt autopushd pushdsilent pushdtohome
## Remove duplicate entries
setopt pushdignoredups
## This reverts the +/- operators.
setopt pushdminus
alias dir="dirs -v"

# PATH
# ----------------
# Go Lang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# shell
# ----------------
alias b="bash"
alias f="fish"

# sys
# ----------------
alias p="pwd"
alias q="exit"
alias qq="exit;exit"
alias c="clear"
alias cls="clear"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -la"
alias his="history"
alias wh="which"
alias sd="sudo shutdown now"
alias m="man"

# tools
# ----------------

# navigation
# ----------------
alias ..="cd ..; ls -l"
alias ...="cd ../..; ls -l"
alias ....="cd ../../..; ls -l"

# softwares
#---------------------------------------------------
alias s="screenfetch &"
alias sx="startx"
alias si="nohup subl >> /dev/null &"
alias sl="slock"
alias sk="nohup screenkey --opacity 0 -s small >>/dev/null &"
alias ks="ps -ef|grep screenkey|grep -v grep|awk '{print \"kill -9 \"\$2}'|sh"
alias dk="docker"
alias mm="mutt"
alias ra="ranger"
alias lz="lazygit"
alias aria="aria2c"
alias rss="newsboat"
alias P="ping -c 1 www.baidu.com &"
alias W="curl wttr.in/shanghai; finger shanghai@graph.no &"
alias IP="ip a|grep -E '^\s+inet .* brd.*dynamic.*'|awk '{print \$2}'"
alias wt="watch -t -n 1 date"
alias tree="tree -C"
alias tran="trans en:zh "
alias trane="trans zh:en "
alias dash="nohup zeal &"                                             # dash
alias book="nohup foliate &"                                          # book
alias termius="nohup termius &"
alias screenshot="nohup flameshot launcher &"
alias screenrecord="nohup simplescreenrecorder &"
alias sound="alsamixer"
alias audiocut="nohup shotcut &"
alias videocut="nohup shotcut &"
alias photoshop="nohup gimp &"
alias shot="nohup flameshot launcher &"
alias google='nohup google --proxy-server="socks5://127.0.0.1:1080" >> /dev/null &'
alias ts="sudo nohup timeshift-launcher &"
alias music="nohup netease-cloud-music &"
alias game="nohup steam &"
alias slack="nohup slack &"
alias email="nohup thunderbird >>/dev/null &"
alias wechat="nohup wechat-uos >> /dev/null &"
alias virtualbox="nohup virtualbox &"
alias tex.xl="xelatex *.tex; bibtex *.aux; xelatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"
alias tex.pl="pdflatex *.tex; bibtex *.aux; pdflatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"

# k8s completion
# ----------------
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

# autojump
# ----------------
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# http request
# ----------------
alias get='curl -i -s -H "Content-Type:application/json"'
alias post='curl -i -s -H "Content-Type:application/json"'

# tmux
# ----------------
alias n="tmux new -s init"
alias a="tmux attach -t init"
alias d="tmux detach"
alias e="exit"

alias tm="tmux"
alias tmlc="tmux list-commands"
alias tmls="tmux list-session"
alias tmlw="tmux list-window"
alias tmlp="tmux list-panes"
alias tmlb="tmux list-buffers"
alias tmns="tmux new -s"
alias tmnw="tmux new-window"
alias tmnwn="tmux new-window -n"
alias tma="tmux attach"
alias tmat="tmux attach -t"
alias tmd="tmux detach"
alias tmdt="tmux detach -t"
alias tms="tmux switch -t"
alias tmks="tmux kill-session"
alias tmkst="tmux kill-session -t"

# vi
# ----------------
alias v="vim"
alias ve="vim +"
alias vo="vim -o"
alias vO="vim -O"
alias vp="vim -p"
alias vr="vim -R"
alias vd="vim -d"

# git
# ----------------
alias g="git"
alias gfc="git fetch --all && git reset --hard origin/master && git pull"
alias gg="git add .; git commit -m 'update'; git push"
alias gs="git status"
alias gl="git log --oneline --graph"
alias gi="git init"
alias ga="git add"
alias gaa="git add --all"
alias grm="git remote"
alias grmv="git remote -v"
alias grma="git remote add"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gf="git fetch"
alias gpl="git pull"
alias gplrp="git pull --rebase=preserve"
alias gps="git push"
alias gm="git merge"
alias gd="git diff"
alias gck="git checkout"
alias gckb="git checkout -b"
alias gckf="git checkout --"    # restore file
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch --delete" # delete local branch
alias gpd="git push --delete"   # delete remote branch
alias gcp="git cherry-pick -x"  # copy ommits to another branch 
alias grb="git rebase"
alias grbc="git rebase --continue"
alias gmt="git mergetool"
alias grs="git reset"
alias grsm="git reset --merge ORIG_HEAD"  # revoke merge
alias grsh="git reset HEAD"               # restore file to last commit
alias grshh="git reset --hard HEAD"       # cancel all changes since last commit
alias gt="git tag"
alias grv="git revert"                    # revert change
alias grvc="git revert --continue"        # revert continue
alias grl="git reflog"
alias gclc="git reflog expire --expire = now all; git gc --prune = now; git push origin --force --all --tags"      # clear all git log

# task
# ----------------
alias tk="task"
alias tka="task add"
alias tkd="task done"
alias tk0="echo 'task add Send Alice a birthday card due:2016-11-08 scheduled:due-4d wait:due-7d until:due+2d'"
alias tkp="echo 'task project:proj list'"
alias tke="task edit"
alias tkm="task modify"
alias tkl="task list"
alias tkn="task next"
alias tkdt="task due:today list"
alias tkda="task due.any: list"
alias tkstart="task start"
alias tkstop="task stop"
alias tkready="task ready"
alias tkwait="task waiting"
alias tkrecur="echo 'task add Do the thing due:2022-01-01T00:00 recur:weekly until:now+1yr'"
alias tkreports="task reports"
alias tksearch="echo 'task /pattern/ list'"
alias tkfilter="echo 'task project:home and -work status:pending /pattern/ list'"
alias tkcfg="echo 'config default.command long'"
alias tkpri="echo 'config -- uda.priority.values H,M,,L'"
alias tktag="echo 'task -+tagx and|or|xor -+tagy list'"
alias tksum="task summary; task ghistory; tark burndown.daily; task calendar"
alias tktags="task _tags"
alias tkstats="task stats"

# timew
# ----------------
alias te="timew"
alias testart="timew start"
alias testop="timew stop"
alias tecontinue="timew continue"
alias tesum="timew summary"
alias tetrak="echo 'timew track 9:00-10:00 tasktracked'"
alias teday="timew day"
alias teweek="timew week"
alias temonth="timew month"
alias tegaps="timew gaps"
alias tee="echo 'timew config exclusions.days.2021_01_01 off :yes'"
alias te1="echo 'timew config exclusions.monday    >1:30 <7:30 12:30-13:00 :yes'"
alias te2="echo 'timew config exclusions.tuesday   >1:30 <7:30 12:30-13:00 :yes'"
alias te3="echo 'timew config exclusions.wednesday >1:30 <7:30 12:30-13:00 :yes'"
alias te4="echo 'timew config exclusions.thursday  >1:30 <7:30 12:30-13:00 :yes'"
alias te5="echo 'timew config exclusions.friday    >1:30 <7:30 12:30-13:00 :yes'"
alias te6="echo 'timew config exclusions.saturday  >2:30 <9:30 12:30-13:00 :yes'"
alias te7="echo 'timew config exclusions.sunday    >2:30 <7:30 12:30-13:00 :yes'"

# taskell
# ----------------
alias taskell="taskell ~/archlinux.cfg/.taskell.md"
alias todo="taskell ~/archlinux.cfg/.taskell.md"

# fzf
# ----------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# search syntax
# 'wild	    - exact-match (quoted)       Items that include wild
# ^music	- prefix-exact-match         Items that start with music
# .mp3$	    - suffix-exact-match         Items that end with .mp3
# !fire	    - inverse-exact-match        Items that do not include fire
# !^music	- inverse-prefix-exact-match Items that do not start with music
# !.mp3$	- inverse-suffix-exact-match Items that do not end with .mp3

# Key bindings for command-line
# CTRL-T - Paste the selected files and directories onto the command-line
    # Set FZF_CTRL_T_COMMAND to override the default command
    # Set FZF_CTRL_T_OPTS to pass additional options
# CTRL-E - Paste the selected command from history onto the command-line
    # If you want to see the commands in chronological order, press CTRL-E again which toggles sorting by relevance
    # Set FZF_CTRL_E_OPTS to pass additional options
# ALT-C - cd into the selected directory
    # Set FZF_ALT_C_COMMAND to override the default command
    # Set FZF_ALT_C_OPTS to pass additional options

# my tools
# ------------------------------------------------------
# fast open
# ----------------
alias v="vim"
alias vin="vim ~/repos/investing/investing.md"
alias vfrm="vim ~/repos/investing/frm.md"
alias vcfa="vim ~/repos/investing/cfa.md"
alias vtmp="vim ~/note/tmp.md"
alias vnote="vim ~/note/note.md"
alias vpassword="vim ~/note/password.md"
alias vtask="vim ~/note/task.md"
alias note="vim ~/notes/note.md"
alias meeting="vim ~/notes/meeting.md"
alias week="vim ~/notes/week.md"

alias ni="nvim"
alias nn="nvim ~/.config/nvim/init.vim"

# jump to dir
# ----------------
alias m="cd ~/archlinux.cfg/scripts; ls -la"
alias ji="cd ~/repos/investing; ls -l"
alias jdoc="cd ~/docs; ranger"
alias jdocl="cd ~/docs-local; ranger"
alias jn="cd ~/note; ls -l"
alias jx="cd ~/x; ranger"
alias jv="cd ~/repos/vip; ls -l"
alias jw="cd ~/x/wks; ranger"
alias jd="cd ~/Downloads; ls -l"
alias jk="cd ~/Desktop; ls -l"
alias jD="cd ~/Documents; ls -l"
alias jO="cd ~/Movies; ls -l"
alias jP="cd ~/Pictures; ls -l"
alias jU="cd ~/Music; ls -l"

# gotohttp
# ---------------
alias goguiup="sudo nohup ~/softwares/gotohttp_gui_x64/gotohttp -p yuhaiyan"
alias goguidown="sudo ~/softwares/gotohttp_gui_x64/uninstall"
alias gocliup="sudo nohup ~/softwares/gotohttp_cli_x64/gotohttp_cli -p yuhaiyan"
alias goclidown="sudo ~/softwares/gotohttp_cli_x64/uninstall"

# for suckless & other c project
# ----------------
alias rc="rm -f config.h"
alias smc="sudo make clean"
alias smci="sudo make clean install"

# wifi
# ----------------
alias 1="sudo sh /root/home.wifi.sh"
alias 2="sudo sh /root/phone.wifi.sh"
alias 3="sudo pkill -9 wpa_supplicant"
alias 4="cd ~/softwares//trojan; sudo ./trojan &; cd"
alias 5="sudo pkill -9 trojan"

# mysql
# ----------------
alias ms="mysql -uroot -proot"

# proxy
# ----------------
# export http_proxy="socks5://127.0.0.1:1080"
# export https_proxy="socks5://127.0.0.1:1080"
# export ALL_PROXY=socks5://127.0.0.1:1080
# alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
# alias unsetproxy="unset ALL_PROXY"

# monitors
# ----------------
alias screen-mirror="xrandr --output eDP1 --auto --same-as DP1"
alias sm="xrandr --output eDP1 --auto --same-as DP1"
# 
alias screen-independent-left="xrandr --output eDP1 --auto --left-of DP1"
alias sil="xrandr --output eDP1 --auto --left-of DP1"
# 
alias screen-independent-right="xrandr --output eDP1 --auto --right-of DP1"
alias sir="xrandr --output eDP1 --auto --right-of DP1"

# key binding
# ----------------
bindkey -s '^F' 'vi $(fzf --preview "cat {}")\n'
bindkey -s '^X' 'vi -c "Calendar -view=week"\n'
bindkey -s '^H' 'vi -c "Calendar -view=clock"\n'
bindkey -s '^R' 'ranger\n'
bindkey -s '^B' 'google\n'
bindkey -s '^G' 'lazygit\n'
bindkey -s '^Y' 'clear; task summary; task ghistory; task calendar; task list\n'
bindkey -s '^W' 'W\n'
bindkey -s '^Z' 'vit\n'             # taskwarrior visual tool
bindkey -s '^A' 'taskell\n'

