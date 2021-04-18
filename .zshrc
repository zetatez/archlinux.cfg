#!/bin/zsh

# Author: Lorenzo
#---------------------------------------------------
export PATH="/usr/local/sbin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vi
set -o vi
TMOUT=

#PS1=$'\n'
PS1=$'\n🏴 ☠\n'
alias 0="PS1=$'\n🏴‍☠️ ☠ %0~\n'"
alias 9="PS1=$'\n%0~\n'"
alias 8="PS1=$'%n@%m:%0~$ '"

# comment with #
setopt interactivecomments

# pacman 
#  ----------------
alias s="screenfetch"
alias pac="sudo pacman -S"
alias ppp="sudo pacman -Syyu"

# softwares
#---------------------------------------------------

# docker 
#  ----------------

# lazygit
#  ----------------
alias lz="lazygit"

# ranger
alias ra="ranger"

# sdkman
#  ----------------

# boost
#  ----------------

# java
#  ----------------

# python
#  ----------------

# julia
#  ----------------

# texlive
#  ----------------

# mongodb
#  ----------------

# mysql
#  ----------------

# vscode
#  ----------------

# emacs
#  ----------------

# typora
#  ----------------

# autojump
#  ----------------

# sys
#  ----------------
alias p="pwd"
alias q="exit"
alias qq="exit; exit"
alias ss="source ~/.zshrc; screenfetch"
alias c="clear"
alias cls="clear"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -la"
alias hi="history -n 1000"
alias wh="which"

# tools
#  ----------------
alias co='pbcopy'
alias pa='pbpaste'
alias shot="screencapture"
alias m="man"

# navigation
alias ..="cd ..; ls -l"
alias ...="cd ../..; ls -l"
alias ....="cd ../../..; ls -l"
alias .....="cd ../../../..; ls -l"

# langs 
#  ----------------
alias py="python"
alias ju="julia"
# alias ja="java"
alias sc="scala"

# tmux
#  ----------------
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
alias n="tmux new -s init"
alias a="tmux attach -t init"
alias d="tmux detach"
alias e="exit"

# vi
#  ----------------
alias v="vi"
alias ve="vi +"
alias vo="vi -o"
alias vO="vi -O"
alias vp="vi -p"
alias vr="vi -R"
alias vd="vi -d"

# mutt
#  ----------------
alias mm="mutt"

# shell
#  ----------------
alias f="fish"
alias z="zsh"
alias b="bash"

# git
#  ----------------
alias g="git"
alias gforce="git fetch --all && git reset --hard origin/master && git pull"
alias gg="git add .; git commit -m 'update'; git push"
alias gs="git status"
alias gl="git log --oneline --graph"
alias gi="git init"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gpl="git pull"
alias gps="git push"
alias gf="git fetch"
alias gm="git merge"
alias gd="git diff"
alias gmt="git mergetool"
alias gb="git branch"
alias gck="git checkout"
alias gckb="git checkout -b"
alias gbd="git branch --delete"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grs="git reset"
alias grh="git reset HEAD"
alias grhh="git reset --hard HEAD"
alias gt="git tag"
alias gr="git remote"
alias gra="git remote add"

# task
#  ----------------
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
#  ----------------
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
#  ----------------
alias taskell="taskell ~/macos.cfg/.taskell.md"
alias tskl="taskell ~/macos.cfg/.taskell.md"

# tree
#  ----------------
alias tree="tree -C"
alias tless="tree -C |less -Rr" 

# markdown
#  ----------------

# latex
#  ----------------
alias tex.xl="xelatex *.tex; bibtex *.aux; xelatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"
alias tex.pl="pdflatex *.tex; bibtex *.aux; pdflatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"

# ping terst
#  ----------------
alias P="ping -c 3 www.baidu.com &"

# weather 
#  ----------------
alias W="curl wttr.in/shanghai; finger shanghai@graph.no &"

# you-get download vedio 
#  ----------------
alias yg="you-get"

# my tools
#  ----------------
# fast open
#  ----------------
alias v="vim"
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias vfish="vim ~/.config/fish/config.fish"
alias vin="vim ~/gitee/investing/investing.md"
alias vfrm="vim ~/gitee/investing/frm.md"
alias vcfa="vim ~/gitee/investing/cfa.md"
alias vn="vim ~/gitee/note/note.md"
alias vp="vim ~/gitee/note/password.json"
alias vt="vim ~/gitee/note/task.md"
alias vtmp="vim ~/gitee/note/tmp.md"

alias x="nvim"
alias xi="nvim"
alias xx="nvim ~/.config/nvim/init.vim"

# jump to dir
#  ----------------
alias m="cd ~/macos.cfg/scripts; ls -la"
alias jd="cd ~/Downloads; ls -l"
alias ji="cd ~/gitee/investing; ls -l"
alias jk="cd ~/Desktop; ls -l"
alias jl="cd ~/lib; ranger"
alias jL="cd ~/lib-local; ranger"
alias jn="cd ~/gitee/note; ls -l"
alias jm="cd ~/Documents; ls -l"
alias jmo="cd ~/Movies; ls -l"
alias jp="cd ~/Pictures; ls -l"
alias jmu="cd ~/Music; ls -l"
alias jv="cd ~/v; ranger"
alias jV="cd ~/gitee/vip; ls -l"
alias jw="cd ~/v/wks; ranger"

# key binding
#  ----------------
bindkey -s '^F' 'vi $(fzf --preview "cat {}")\n'
bindkey -s '^X' 'vi -c "Calendar -view=week"\n'
bindkey -s '^H' 'vi -c "Calendar -view=clock"\n'
bindkey -s '^R' 'ranger .\n'
bindkey -s '^B' 'open https://www.baidu.com\n'
bindkey -s '^G' 'lazygit\n'
bindkey -s '^Y' 'clear; task summary; task ghistory; task calendar; task list\n'
bindkey -s '^W' 'clear; W\n'

# ssh: s.
#  ----------------
# source ~/.ssh.list

# show time
#  ----------------
alias wt="watch -t -n 1 date"

# mysql
#  ----------------
alias ms="mysql -uroot -proot"

# http request
#  ----------------
alias get='curl -i -s -H "Content-Type:application/json"'
alias post='curl -i -s -H "Content-Type:application/json"'

# fzf
#  ----------------
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

# Faster your dock hide and show
#  ----------------
# ACCELERATE:
# defaults write com.apple.dock autohide-time-modifier -float 0;killall Dock
# RESTORE TO DEFAULT
# defaults delete com.apple.dock autohide-delay; killall Dock


