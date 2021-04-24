#!/usr/local/bin/fish

# Author: Lorenzo
#---------------------------------------------------
set -x LANG en_CA.UTF-8
set -x LC_ALL en_CA.UTF-8
set TMOUT
set -x EDITOR vim

set -g fish_key_bindings fish_vi_key_bindings

# emulates vim's cursor shape behavior
# set the normal and visual mode cursors to a block
set fish_cursor_default block
# set the insert mode cursor to a line
# set fish_cursor_insert line
# set the replace mode cursor to an underscore
# set fish_cursor_replace_one underscore
# the following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

function fish_mode_prompt
end

function fish_prompt
    printf \n\n
end

function fish_prompt0
    printf \n\n
end
alias 0 fish_prompt0

function fish_prompt9
    printf "\n%s\n" "$PWD"
end
alias 9 fish_prompt9

function fish_prompt8
    printf "\n%s" "$hostname"
    printf "@%s:" "$USER"
    printf "%s\n" "$PWD"
end
alias 8 fish_prompt8

function fish_greeting
    echo '# Pf:'
end

function on_exit --on-event fish_exit
    echo
    echo "QED."
end

# fuzzy
function ff
    command fzf | xargs -r -I % $EDITOR %
end

# softwares
#---------------------------------------------------
# docker 
alias dk        "/usr/local/bin/docker"

# python
alias python    "/usr/local/bin/python3"
alias pip       "/usr/local/bin/pip3"

# navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# abbr 
# ---------------
abbr g "git"
abbr m "mutt"

# alies
# ---------------
# sys
#  ------
alias q         "exit"
alias qq        "exit; exit"
alias ss        "source ~/.config/fish/config.fish"
alias c         "clear"
alias cls       "clear"
alias l         "ls -l"
alias ll        "ls -l"
alias la        "ls -la"
alias hi        "history"
alias m         "man"

# langs 
#  ------
alias py        "python"
alias ip        "ipython"
alias ju        "julia"
alias ja        "java"
alias sc        "scala"

# tmux
#  ------
alias t.        "tmux"
alias t.l       "tmux list-session"
alias t.ls      "tmux list-session"
alias t.lw      "tmux list-window"
alias t.lp      "tmux list-panes"
alias t.lb      "tmux list-buffers"
alias t.ns      "tmux new -s"
alias t.a       "tmux attach"
alias t.at      "tmux attach -t"
alias t.d       "tmux detach"
alias t.dt      "tmux detach -t"
alias t.ks      "tmux kill-session"
alias t.kst     "tmux kill-session -t"
# fast start
alias n         "tmux new-session -s init"
alias a         "tmux attach -t init"
alias d         "tmux detach"

# vi
#  ------
alias v         "vi"
alias ve        "vi +"
alias vo        "vi -o"
alias vO        "vi -O"
alias vp        "vi -p"
alias vr        "vi -R"
alias vd        "vi -d"

# mutt
#  ------
alias m        "mutt"

# fish
#  ------
alias f         "fish"
alias z         "zsh"

# git
#  ------
alias g         "git"
alias gforce    "git fetch --all && git reset --hard origin/master && git pull"
alias gg        "git add .; git commit -m 'update'; git push"
alias gs        "git status"
alias gl        "git log --oneline --graph"
alias gi        "git init"
alias ga        "git add"
alias gaa       "git add --all"
alias gc        "git commit -m"
alias gca       "git commit --amend"
alias gpl       "git pull"
alias gps       "git push"
alias gf        "git fetch"
alias gm        "git merge"
alias gd        "git diff"
alias gmt       "git mergetool"
alias gb        "git branch"
alias gck       "git checkout"
alias gckb      "git checkout -b"
alias gbd       "git branch --delete"
alias grb       "git rebase"
alias grbc      "git rebase --continue"
alias grs       "git reset"
alias grh       "git reset HEAD"
alias grhh      "git reset --hard HEAD"
alias gt        "git tag"
alias gr        "git remote"
alias gra       "git remote add"

# task
#  ------
abbr  t         "task"
alias tk        "task"
alias ta        "task add"
alias ta0       "echo 'task add Send Alice a birthday card due:2016-11-08 scheduled:due-4d wait:due-7d until:due+2d'"
alias trec      "echo 'task add Do the thing due:2022-01-01T00:00 recur:3:weekly until:4:now+1yr'"
alias tp        "echo 'task project:proj list'"
alias te        "task edit"
alias tm        "task modify"
alias tl        "task list"
alias tn        "task next"
alias tc        "task due:today list"
alias td        "task due.any: list"
alias tsta      "task start"
alias tsto      "task stop"
alias tdon      "task done"
alias trea      "task ready"
alias twai      "task waiting"
alias trep      "task reports"
alias tsea      "echo 'task /pattern/ list'"
alias tfil      "echo 'task project:home and -work status:pending /pattern/ list'"
alias tsum      "task summary; task ghistory; tark burndown.daily; task calendar"
alias tcfg      "echo 'config default.command long'"
alias tpri      "echo 'config -- uda.priority.values H,M,,L'"
alias ttag      "echo 'task -+tagx and|or|xor -+tagy list'"
alias ttags     "task _tags"
alias tstats    "task stats"

# timew
#  ------
alias tw        "timew"
alias twsta     "timew start"
alias twsto     "timew stop"
alias twsum     "timew summary"
alias twcon     "timew continue"
alias twcon     "timew continue"
alias twtag     "echo 'timew start tagx tagy'"
alias twh       "echo 'timew help'; timew help"
alias twtra     "echo 'timew track 9:00-10:00 tasktracked'"
alias twd       "timew day"
alias tww       "timew week"
alias twm       "timew month"
alias twg       "timew gaps"
alias twe       "echo 'timew config exclusions.days.2021_01_01 off :yes'"
alias twemon    "echo 'timew config exclusions.monday    q >1:30 <7:30 12:30-13:00 q :yes'"
alias twetue    "echo 'timew config exclusions.tuesday   q >1:30 <7:30 12:30-13:00 q :yes'"
alias twewed    "echo 'timew config exclusions.wednesday q >1:30 <7:30 12:30-13:00 q :yes'"
alias twethu    "echo 'timew config exclusions.thursday  q >1:30 <7:30 12:30-13:00 q :yes'"
alias twefri    "echo 'timew config exclusions.friday    q >1:30 <7:30 12:30-13:00 q :yes'"
alias twesat    "echo 'timew config exclusions.saturday  q >2:30 <9:30 12:30-13:00 q :yes'"
alias twesun    "echo 'timew config exclusions.sunday    q >2:30 <7:30 12:30-13:00 q :yes'"
# timew config exclusions.monday    '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.tuesday   '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.wednesday '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.thursday  '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.friday    '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.saturday  '<8:30 12:30-13:00 >23:30' :yes
# timew config exclusions.sunday    '<8:30 12:30-13:00 >23:30' :yes

# tree
#  ------
alias tree      "tree -C"
alias tless     "tree -C |less -Rr" 

# markdown
#  ------
alias md        "Applications/Typora.app/Contents/MacOS/typora"
alias typora    "Applications/Typora.app/Contents/MacOS/typora"

# latex
#  ------
alias tex.xl    "xelatex *.tex; bibtex *.aux; xelatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"
alias tex.pl    "pdflatex *.tex; bibtex *.aux; pdflatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"

# ping terst
#  ------
alias P         "ping -c 3 www.baidu.com &"

# weather 
#  ------
alias W         "curl wttr.in/shanghai; finger shanghai@graph.no &"

# you-get download vedio 
#  ------
alias yg        "you-get"

# my tools
#  ------
# evolving evo shell
alias evo        "~/evolving/evo"

# fask open
#  ------
# alias vi="nvim"
alias vv         "vi ~/.vimrc"
alias vz         "vi ~/.zshrc"
alias vs         "vi ~/.config/fish/config.fish"
alias vin        "vi ~/investing/investing.md"
alias vinv       "vi ~/investing/investing.md"
alias vf         "vi ~/investing/frm.md"
alias vfrm       "vi ~/investing/frm.md"
alias vc         "vi ~/investing/cfa.md"
alias vcfa       "vi ~/investing/cfa.md"
alias vn         "vi ~/.note/note.md"
alias vnote      "vi ~/.note/note.md"
alias vpass      "vi ~/.note/password.json"
alias vpassword  "vi ~/.note/password.json"
alias vt         "vi ~/.note/task.md"
alias vtask      "vi ~/.note/task.md"
alias vtmp       "vi ~/./note/tmp.md"

# sync repos
#  ------
alias hh         "cd ~/cfgs/;gpl; gg &;cd ~&"
alias ii         "cd ~/investing/; gpl;gg &;cd ~ &"
alias nn         "cd ~/.note/;gpl; gg &;cd ~ &"
alias pp         "cd ~/.vip/;gpl; gg &;cd ~ &"
alias ee         "cd ~/evolving/;gpl; gg &;cd ~ &"

# go to dir
#  ------
alias cfg        "cd ~/cfgs; ls -l"
alias jd         "cd ~/Downloads; ls -l"
alias ji         "cd ~/investing; ls -l"
alias jk         "cd ~/Desktop; ls -l"
alias jl         "cd ~/lib; ranger"
alias jL         "cd ~/lib-local; ranger"
alias jn         "cd ~/.note; ls -l"
alias jm         "cd ~/Documents; ls -l"
alias jmo        "cd ~/Movies; ls -l"
alias jp         "cd ~/Pictures; ls -l"
alias jmu        "cd ~/Music; ls -l"
alias jv         "cd ~/v; ranger"
alias jV         "cd ~/.vip; ls -l"
alias jw         "cd ~/v/wks; ranger"

# lazygit
#  ------
alias lz         "lazygit"

# key binding
#  ------
bind -M insert \cf "vi (fzf)" 
bind -M insert \cx "vi -c 'Calendar -view=month'" 
bind -M insert \cr "ranger ." 
bind -M insert \cg "lazygit ."
bind -M insert \ct "clear; task list; timew week" 
bind -M insert \cs "zsh" 

# ssh
#  ------
source ~/.ssh.list.fish



