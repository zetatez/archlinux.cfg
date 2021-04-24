# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status is-interactive
#   ...
# end

# Author: Lorenzo
# ---------------------------------------------------
set -x LANG en_CA.UTF-8
set -x LC_ALL en_CA.UTF-8

set -U EDITOR vim
set TMOUT

# vim mode commands 
fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# function fish_mode_prompt; end
# funcsave fish_mode_prompt; end
function fish_mode_prompt
  switch $fish_bind_mode
    case default
      echo '<n>'
    case insert
      echo '<i>'
    case replace_one
      echo '<r>'
    case visual
      echo '<v>'
    case '*'
      echo '<?>'
  end
  set_color normal
end

# prompt
function fish_prompt
    printf " ☠ %s:%s ⋊> \n\b" "$USER" (fish_git_prompt)
end

function fish_prompt0
    printf "\n\n\b"
end
abbr 0 fish_prompt0

function fish_prompt9
    printf " ☠ %s@%s:%s ⋊> \n\b" "$hostname" "$USER" (fish_git_prompt)
end
abbr 9 fish_prompt9

function fish_greeting
    echo '# Pf:'
end

function on_exit --on-event fish_exit
    echo
    echo "QED."
end

#---------------------------------------------------
# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
# openssl
set PATH  /usr/local/opt/openssl@1.1/bin            $PATH
# boost
set PATH  /usr/local/opt/icu4c/bin                  $PATH
set PATH  /usr/local/opt/icu4c/sbin                 $PATH
# java
set PATH  /usr/local/opt/openjdk/bin                $PATH
# tex
set PATH  /usr/local/texlive/2020/bin/x86_64-darwin $PATH
# mongodb
set PATH  /usr/local/mongodb/bin:                   $PATH
# mysql
set PATH  /usr/local/mysql/bin:                     $PATH

#---------------------------------------------------
# shell
# ---------------
abbr f          "fish"
abbr z          "zsh"
abbr b          "bash"

# fuzzy
function ff
    command fzf | xargs -r -I % $EDITOR %
end

# navigation
# ---------------
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# screenfetch
# ---------------
abbr s          "screenfetch &"
# abbr sk         "/Applications/KeyCastr.app/Contents/MacOS/KeyCastr &"
# abbr ks         "ps -ef | grep KeyCastr|grep -v grep|awk '{print \"kill -9 \"\$2}'|sh"
alias sk        "screenkey &"
alias ks        "ps -ef|grep screenkey|grep -v grep|awk '{print \"kill -9 \"\$2}'|sh"


# sys             llias
# --------------- llias
abbr p          "pwd"
abbr q          "exit"
abbr qq         "exit; exit"
abbr ss         "source /usr/local/etc/fish/config.fish"
abbr c          "clear"
abbr cls        "clear"
abbr l          "ls -l"
abbr ll         "ls -l"
abbr la         "ls -la"
abbr hi         "history"
abbr wh         "which"

# langs 
# ---------------
abbr py         "python"
abbr python     "/usr/local/bin/python3"
abbr pip        "/usr/local/bin/pip3"
abbr ju         "julia"
abbr sc         "scala"
abbr dk         "/usr/local/bin/docker"
abbr code       "/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
abbr k          "kubectl"

# lazygit
# ---------------
abbr lz         "lazygit"

# ranger
# ---------------
abbr ra         "ranger"

# tmux
# ---------------
abbr t          "tmux"
abbr tlc        "tmux list-commands"
abbr tls        "tmux list-session"
abbr tlw        "tmux list-window"
abbr tlp        "tmux list-panes"
abbr tlb        "tmux list-buffers"
abbr tns        "tmux new -s"
abbr ta         "tmux attach"
abbr tat        "tmux attach -t"
abbr td         "tmux detach"
abbr tdt        "tmux detach -t"
abbr tks        "tmux kill-session"
abbr tkst       "tmux kill-session -t"
abbr n          "tmux new-session -s init"
abbr a          "tmux attach -t init"
abbr d          "tmux detach"

# vi
# ---------------
abbr v          "nvim"
abbr vi         "vim"
abbr vv         "vi ~/.vimrc"
abbr xx         "vi ~/.config/nvim/init.vim"
abbr vz         "vi ~/.zshrc"
abbr vs         "vi /usr/local/etc/fish/config.fish"

abbr v          "vi"
abbr ve         "vi +"
abbr vo         "vi -o"
abbr vO         "vi -O"
abbr vp         "vi -p"
abbr vr         "vi -R"
abbr vd         "vi -d"
;
# mutt
# ---------------
abbr m          "mutt"

# git
# ---------------
abbr g          "git"
abbr gfc        "git fetch --all && git reset --hard origin/master && git pull"
abbr gg         "git add .; git commit -m 'update'; git push"
abbr gs         "git status"
abbr gl         "git log --oneline --graph"

abbr gi         "git init"
abbr ga         "git add"
abbr gaa        "git add --all"

abbr grm        "git remote"
abbr grmv       "git remote -v"
abbr grma       "git remote add"
abbr grmr       "git remote remove"

abbr gc         "git commit -m"
abbr gca        "git commit --amend"

abbr gf         "git fetch"
abbr gpl        "git pull"
abbr gplrp      "git pull --rebase = preserve"
abbr gps        "git push"
abbr gm         "git merge"
abbr gd         "git diff"

abbr gck        "git checkout"
abbr gckb       "git checkout -b"
abbr gckf       "git checkout --"             # restore file

abbr gb         "git branch"
abbr gba        "git branch -a"
abbr gbd        "git branch --delete"         # delete local branch
abbr gpd        "git push --delete"           # delete remote branch
abbr gcp        "git cherry-pick -x"          # duplicate commit to new branch

abbr grb        "git rebase"
abbr grbc       "git rebase --continue"
abbr gmt        "git mergetool"

abbr grs        "git reset"                   # change HEAD point
abbr grs        "git reset --merge ORIG_HEAD" # revoke merge
abbr grsh       "git reset HEAD"              # restore file to last commit
abbr grshh      "git reset --hard HEAD"       # cancel all changes after last commit

abbr gt         "git tag"

abbr grv        "git revert"                  # revert change
abbr grvc       "git revert --continue"       # revert continue

abbr grl        "git reflog"
abbr grle       "git reflog expire --expire = now all"        # clear all git log
abbr ggc        "git gc --prune = now"                        # clear all git log
abbr gpofat     "git push origin --force --all --tags"        # clear all git log


# task
# ---------------
abbr tk         "task"
abbr tka        "task add"
abbr tk0        "echo 'task add Send Alice a birthday card due:2016-11-08 scheduled:due-4d wait:due-7d until:due+2d'"
abbr tkrec      "echo 'task add Do the thing due:2022-01-01T00:00 recur:weekly until:now+1yr'"
abbr tkp        "echo 'task project:proj list'"
abbr tke        "task edit"
abbr tkm        "task modify"
abbr tkl        "task list"
abbr tkn        "task next"
abbr tkc        "task due:today list"
abbr tkd        "task due.any: list"
abbr tksta      "task start"
abbr tksto      "task stop"
abbr tkdon      "task done"
abbr tkrea      "task ready"
abbr tkwai      "task waiting"
abbr tkrep      "task reports"
abbr tksea      "echo 'task /pattern/ list'"
abbr tkfil      "echo 'task project:home and -work status:pending /pattern/ list'"
abbr tktags     "task _tags"
abbr tkstats    "task stats"

# timew
# ---------------
abbr tw         "timew"
abbr twsta      "timew start"
abbr twsto      "timew stop"
abbr twsum      "timew summary"
abbr twcon      "timew continue"
abbr twcon      "timew continue"
abbr twtag      "echo 'timew start tagx tagy'"
abbr twh        "echo 'timew help'; timew help"
abbr twtra      "echo 'timew track 9:00-10:00 tasktracked'"
abbr twd        "timew day"
abbr tww        "timew week"
abbr twm        "timew month"
abbr twg        "timew gaps"
abbr twe        "echo 'timew config exclusions.days.2021_01_01 off :yes'"
abbr twemon     "echo 'timew config exclusions.monday    q >1:30 <7:30 12:30-13:00 q :yes'"
abbr twetue     "echo 'timew config exclusions.tuesday   q >1:30 <7:30 12:30-13:00 q :yes'"
abbr twewed     "echo 'timew config exclusions.wednesday q >1:30 <7:30 12:30-13:00 q :yes'"
abbr twethu     "echo 'timew config exclusions.thursday  q >1:30 <7:30 12:30-13:00 q :yes'"
abbr twefri     "echo 'timew config exclusions.friday    q >1:30 <7:30 12:30-13:00 q :yes'"
abbr twesat     "echo 'timew config exclusions.saturday  q >2:30 <9:30 12:30-13:00 q :yes'"
abbr twesun     "echo 'timew config exclusions.sunday    q >2:30 <7:30 12:30-13:00 q :yes'"
# timew config exclusions.monday    '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.tuesday   '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.wednesday '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.thursday  '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.friday    '<7:30 12:30-13:00 >23:30' :yes
# timew config exclusions.saturday  '<8:30 12:30-13:00 >23:30' :yes
# timew config exclusions.sunday    '<8:30 12:30-13:00 >23:30' :yes

# tree
# ---------------
abbr tree      "tree -C"

# markdown
# ---------------

# latex
# ---------------
abbr tex.xl    "xelatex *.tex; bibtex *.aux; xelatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"
abbr tex.pl    "pdflatex *.tex; bibtex *.aux; pdflatex *.tex; rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.log; rm -f *.out; open *.pdf"

# ping terst
# ---------------
abbr P         "ping -c 3 www.baidu.com &"

# weather 
# ---------------
abbr W         "curl wttr.in/shanghai; finger shanghai@graph.no &"

# jump 
# ---------------
abbr m          "cd ~/macos.cfg/scripts; ls -la"
abbr jd         "cd ~/Downloads; ls -l"
abbr jk         "cd ~/Desktop; ls -l"
abbr jgt        "cd ~/gitee; ls -l"
abbr jgh        "cd ~/github; ls -l"

# lazygit
# ---------------
abbr lz         "lazygit"

# http request
# ---------------
abbr get        'curl -i -s -H "Content-Type:application/json"'
abbr post       'curl -i -s -H "Content-Type:application/json"'

# mysql
# ---------------
abbr ms         "mysql -uroot -proot"

# key binding
# ---------------
bind -M insert \cf "vi (fzf --preview 'cat {}')"
bind -M insert \cx "vi -c 'Calendar -view=week'" 
bind -M insert \ch "vi -c 'Calendar -view=clock'" 
bind -M insert \ce "ranger ." 
bind -M insert \cg "lazygit ."
bind -M insert \cy "clear; task summary; task ghistory; task calendar; task list" 
bind -M insert \cw "curl wttr.in/shanghai; finger shanghai@graph.no &"


