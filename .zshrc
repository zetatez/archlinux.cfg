#!/bin/zsh

# author: Lorenzo
#---------------------------------------------------
alias ss="source ~/.zshrc; screenfetch"
alias vz="vim /etc/zshrc"

# ENV
# ----------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vi
set -o vi
TMOUT=

# comment with #
# ----------------
setopt interactivecomments

# prompt
# ----------------
autoload -U colors && colors
autoload -U promptinit
promptinit
# prompt -l
# prompt -p
# prompt walters
PS1=$'\n F ☠\n'
# PROMPT="%{$fg_bold[yellow]%}F%{$reset_color%} ☠ >> %{$reset_color%}%"
# alias 9="PS1=$'\n%0~☠\n'"
# alias 0="PS1=$'%n@%m:%0~$ '"

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


# pacman 
# ----------------
alias s="screenfetch"
alias pac="sudo pacman -S"
alias ppp="sudo pacman -Syyu"

# shell
# ----------------
alias b="bash"
alias f="fish"
alias z="zsh"

# sys
# ----------------
alias p="pwd"
alias q="exit"
alias qq="exit; exit"
alias c="clear"
alias cls="clear"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -la"
alias his="history"
alias wh="which";

# tools
# ----------------
# alias co='pbcopy'
# alias pa='pbpaste'
# alias shot="screencapture"
alias m="man"

# navigation
# ----------------
alias ..="cd ..; ls -l"
alias ...="cd ../..; ls -l"
alias ....="cd ../../..; ls -l"
alias .....="cd ../../../..; ls -l"


# softwares
#---------------------------------------------------
alias sl="slock"
alias s="screenfetch &"
alias sss="startx"
alias sk="screenkey --opacity 0 &"
alias ks="ps -ef|grep screenkey|grep -v grep|awk '{print \"kill -9 \"\$2}'|sh"
alias mm="mutt"
alias lz="lazygit"
alias ra="ranger"
alias spotlight="synapse &"
alias screenshot="flameshot"
alias screenrecord="simplescreenrecorder"
alias si="subl &"
alias dk="docker"
alias audiocut="shotcut &"
alias videocut="shotcut &"
alias photoshop="gimp &"
alias music="netease-cloud-music &"
alias game="steam &"
alias email="thunderbird &"
alias wechat="wechat-uos &"
alias slack="slack &"
alias virtualbox="virtualbox &"
alias tree="tree -C"
alias tex.xl="xelatex *.tex; bibtex *.aux; xelatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"
alias tex.pl="pdflatex *.tex; bibtex *.aux; pdflatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"
alias P="ping -c 3 www.baidu.com &"
alias W="curl wttr.in/shanghai; finger shanghai@graph.no &"
alias wt="watch -t -n 1 date"

# http request
# ----------------
alias get='curl -i -s -H "Content-Type:application/json"'
alias post='curl -i -s -H "Content-Type:application/json"'

# sdkman
# ----------------

# boost
# ----------------

# java
# ----------------

# python
# ----------------

# julia
# ----------------

# texlive
# ----------------

# mongodb
# ----------------

# mysql
# ----------------

# vscode
# ----------------

# emacs
# ----------------

# typora
# ----------------

# autojump
# ----------------
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# langs 
# ----------------
alias py="python"
alias ju="julia"
alias ja="java"
alias sc="scala"

# tmux
# ----------------
alias n="tmux new -s init"
alias a="tmux attach -t init"
alias d="tmux detach"
alias e="exit"

alias t="tmux"
alias tlc="tmux list-commands"
alias tls="tmux list-session"
alias tlw="tmux list-window"
alias tlp="tmux list-panes"
alias tlb="tmux list-buffers"
alias tns="tmux new -s"
alias tnw="tmux new-window"
alias tnwn="tmux new-window -n"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias td="tmux detach"
alias tdt="tmux detach -t"
alias ts="tmux switch -t"
alias tks="tmux kill-session"
alias tkst="tmux kill-session -t"

# vi
# ----------------
alias v="vi"
alias ve="vi +"
alias vo="vi -o"
alias vO="vi -O"
alias vp="vi -p"
alias vr="vi -R"
alias vd="vi -d"

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
alias grmr="git remote add"

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
alias grle="git reflog expire --expire = now all"      # clear all git log
alias ggc="git gc --prune = now"                       # clear all git log
alias gpofat="git push origin --force --all --tags"    # clear all git log

# task
# ----------------
alias tk="task"
alias tka="task add"
alias tk0="echo 'task add Send Alice a birthday card due:2016-11-08 scheduled:due-4d wait:due-7d until:due+2d'"
alias tkrec="echo 'task add Do the thing due:2022-01-01T00:00 recur:weekly until:now+1yr'"
alias tkp="echo 'task project:proj list'"
alias tke="task edit"
alias tkm="task modify"
alias tkl="task list"
alias tkn="task next"
alias tkc="task due:today list"
alias tkd="task due.any: list"
alias tksta="task start"
alias tksto="task stop"
alias tkdon="task done"
alias tkrea="task ready"
alias tkwai="task waiting"
alias tkrep="task reports"
alias tksea="echo 'task /pattern/ list'"
alias tkfil="echo 'task project:home and -work status:pending /pattern/ list'"
alias tksum="task summary; task ghistory; tark burndown.daily; task calendar"
alias tkcfg="echo 'config default.command long'"
alias tkpri="echo 'config -- uda.priority.values H,M,,L'"
alias tktag="echo 'task -+tagx and|or|xor -+tagy list'"
alias tktags="task _tags"
alias tkstats="task stats"

# timew
# ----------------
alias tw="timew"
alias twsta="timew start"
alias twsto="timew stop"
alias twsum="timew summary"
alias twcon="timew continue"
alias twcon="timew continue"
alias twtag="echo 'timew start tagx tagy'"
alias twh="echo 'timew help'; timew help"
alias twtra="echo 'timew track 9:00-10:00 tasktracked'"
alias twd="timew day"
alias tww="timew week"
alias twm="timew month"
alias twg="timew gaps"
alias twe="echo 'timew config exclusions.days.2021_01_01 off :yes'"
alias twemon="echo 'timew config exclusions.monday    q >1:30 <7:30 12:30-13:00 q :yes'"
alias twetue="echo 'timew config exclusions.tuesday   q >1:30 <7:30 12:30-13:00 q :yes'"
alias twewed="echo 'timew config exclusions.wednesday q >1:30 <7:30 12:30-13:00 q :yes'"
alias twethu="echo 'timew config exclusions.thursday  q >1:30 <7:30 12:30-13:00 q :yes'"
alias twefri="echo 'timew config exclusions.friday    q >1:30 <7:30 12:30-13:00 q :yes'"
alias twesat="echo 'timew config exclusions.saturday  q >2:30 <9:30 12:30-13:00 q :yes'"
alias twesun="echo 'timew config exclusions.sunday    q >2:30 <7:30 12:30-13:00 q :yes'"
# timew config exclusions.monday    '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.tuesday   '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.wednesday '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.thursday  '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.friday    '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.saturday  '<8:30 12:30-13:00 >23:30' :yes
# timew config exclusions.sunday    '<8:30 12:30-13:00 >23:30' :yes

# taskell
# ----------------
alias taskell="taskell ~/macos.cfg/.taskell.md"
alias tskl="taskell ~/macos.cfg/.taskell.md"

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
# ----------------
# fast open
# ----------------
alias v="vim"
alias vv="vim ~/.vimrc"
alias vin="vim ~/repos/investing/investing.md"
alias vfrm="vim ~/repos/investing/frm.md"
alias vcfa="vim ~/repos/investing/cfa.md"
alias vn="vim ~/note/note.md"
alias vp="vim ~/note/password.json"
alias vt="vim ~/note/task.md"
alias vtmp="vim ~/note/tmp.md"

alias x="nvim"
alias xi="nvim"
alias xx="nvim ~/.config/nvim/init.vim"

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

# key binding
# ----------------
bindkey -s '^F' 'vi $(fzf --preview "cat {}")\n'
bindkey -s '^X' 'vi -c "Calendar -view=week"\n'
bindkey -s '^H' 'vi -c "Calendar -view=clock"\n'
bindkey -s '^R' 'ranger .\n'
bindkey -s '^B' 'google https://www.bing.com\n'
bindkey -s '^G' 'lazygit\n'
bindkey -s '^Y' 'clear; task summary; task ghistory; task calendar; task list\n'
bindkey -s '^W' 'W\n'
bindkey -s '^E' 'synapse &\n'

# gotohttp
alias goguiup="sudo nohup ~/softwares/gotohttp_gui_x64/gotohttp -p yuhaiyan"
alias goguidown="sudo ~/softwares/gotohttp_gui_x64/uninstall"
alias gocliup="sudo nohup ~/softwares/gotohttp_cli_x64/gotohttp_cli -p yuhaiyan"
alias goclidown="sudo ~/softwares/gotohttp_cli_x64/uninstall"

# ssh
alias s.0="ssh floren@lorenzo"                                      # home star
alias s.w="sshpass -p 'Orcl1107' ssh -p 22222 dblog@10.100.69.13"   # fucking work
alias s.c="sshpass -p 'passw0rd' ssh -p 22 root@192.168.31.184"     # centos

# mysql
# ----------------
alias ms="mysql -uroot -proot"

