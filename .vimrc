"  _____ _     _       _      ____  _  __  __                     _     _
" |_   _| |__ (_)_ __ | | __ |  _ \(_)/ _|/ _| ___ _ __ ___ _ __ | |_  | |
"   | | | '_ \| | '_ \| |/ / | | | | | |_| |_ / _ \ '__/ _ \ '_ \| __| | |
"   | | | | | | | | | |   <  | |_| | |  _|  _|  __/ | |  __/ | | | |_  |_|
"   |_| |_| |_|_|_| |_|_|\_\ |____/|_|_| |_|  \___|_|  \___|_| |_|\__| (_)
"
" AUTHOR : lorenzo
" :source snapshot.vim to recover
" or execute: vim -S snapshot.vim

"-------------------------------------------------------
" |   skills                flag=f1                    |
"-------------------------------------------------------
"""""" tips
" /\v({}[]                                                              " pattern:very magiv mode, regular expression will more like python, ()[]{} will no need \!
" v enter visual mode, then /search !!!                                 " show current edit filename and status
" C-g                                                                   " show current edit filename and status
" f                                                                     " jump from chars. ; forward. , backward
" :r ! ls -la                                                           " read any exec result from shell
" :earlier 15m                                                          " restore file to 15 min ago
" :saveas filename                                                      " save current file as a new file
" :tabdo %s/foo/bar/g                                                   " refactor
" gUiw/guiw                                                             " switch case of the current word

"""""" cmd editing window: history! search history !!! very powerful
" q:
" q/
" when in cmd mode use <C-f> to open cmd editor window

" useage 1: paste your cmds from current editing file to cmd editing window, and read cmd results to current editing file
" ls -l
" esc
" I r!: r! ls -l
" esc
" yy to copy: r! ls -l
" q:p<CR>

"""""" insert mode
" C-o                                                                   ” execute one command, return to Insert mode
" C-r                                                                   ” insert the contents os a register: 0-9a-z"%#*+:.-=
" C-h                                                                   " del a char
" C-w                                                                   " del a word
" C-u                                                                   ” del to ^
" C-m                                                                   ” begin a new line
" C-i                                                                   ” insert a tab
" C-t                                                                   ” add    indent current line
" C-d                                                                   ” delete indent current line
" C-n                                                                   ” complete word next
" C-p                                                                   ” complete word previous

"""""" completion
" C-x C-l                                                               " complete the whole line
" C-x C-n                                                               " complete word form current buffer
" C-x C-k                                                               " complete word form directory
" C-x C-t                                                               " complete synonym
" C-x C-i                                                               " complete word form current file and include files

"""""" foldenable
" zc                                                                    " close a fold
" zo                                                                    " open  a fold
" zM                                                                    " close all fold
" zR                                                                    " open  all fold

"""""" bookmarks
" mm                                                                    " mark with m
" `m                                                                    " goto mark m
" 'm                                                                    " goto mark m
" `"                                                                    " to the position where you did last edit before exit
" '<                                                                    " to the first line of previously selected visual area
" '>                                                                    " to the last line of previously selected visual area
" '.                                                                    " to the position of where the last change was made
" `[                                                                    " to the first character of previously changed or yanked text
" `]                                                                    " to the last character of previously changed or yanked text
" '^                                                                    " to the position where the cursor was the last time when insert mode was stopped

"""""" search pattern1 change to pattern2
" /pattern1<CR>
" c/pattern2/e<CR>
" new contents<ESC>

""""" search word, change it to a new word, jump next
" /word<CR>
" c//e<CR>
" new word<ESC>
" //<CR>
    
"-------------------------------------------------------
" |   skills end                                       |
"-------------------------------------------------------

""""""
"""""" Auto load for first time uses
" Time consuming, turn it off, only for first time use
" if empty(glob('~/.vim/autoload/plug.vim'))
"     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

""""""
"""""" alway keep a backup
silent! execute "!cp -f ~/.vimrc ~/.vimrc.bk"

""""""
"""""" TOP
set nocompatible
let mapleader="\<SPACE>"

"-------------------------------------------------------
" |   vim-plug start        flag=f2                    |
"-------------------------------------------------------
" configure vim, make it's build in plug-ins loadable
filetype plugin on
call plug#begin('~/.vim/plugged')
""""""
"""""" startify
Plug 'mhinz/vim-startify'

""""""
"""""" calendar;
Plug 'itchyny/calendar.vim'
let g:calendar_views= ['year', 'month', 'clock', 'day_7', 'day', 'month', 'agenda', 'event']
let g:calendar_cyclic_view=1
let g:calendar_skip_event_delete_confirm=1
let g:calendar_skip_task_delete_confirm=1
let g:calendar_skip_task_clear_completed_confirm=1
let g:calendar_google_calendar = 0
let g:calendar_google_task = 0
nnoremap <LEADER>x :Calendar -view=month<CR>
cnoremap ;d Calendar -view=day<CR>
cnoremap ;w Calendar -view=week<CR>
cnoremap ;m Calendar -view=month<CR>
nnoremap \\ :call CalendarToggle()<CR>
let g:calendar_is_open = 0
function! CalendarToggle()
    if g:calendar_is_open
        :q
        let g:calendar_is_open = 0
    else
        :Calendar -view=clock -position=here<CR>
        let g:calendar_is_open = 1
    endif
endfunction

""""""
"""""" language xkbswitch: it make vim very slow, better not use
" git clone git@github.com:lyokha/vim-xkbswitch.git
" cp vim-xkbswitch/bin/xkbswitch  /usr/local/bin/
" git clone git@github.com:myshov/libxkbswitch-macosx.git
" cp libxkbswitch-macosx/bin/libxkbswitch.dylib /usr/local/lib/
" Plug 'lyokha/vim-xkbswitch'
" let g:XkbSwitchEnabled = 1
" inoremap 健康 <ESC>

""""""
"""""" tmux
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_disable_when_zoomed = 1
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split

""""""
"""""" ranger
Plug 'francoiscabrol/ranger.vim'
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 0
nnoremap <LEADER>r :RangerNewTab<CR>

""""""
"""""" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. You need to change this to something other than <\> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger = '<TAB>'
let g:UltiSnipsJumpForwardTrigger = '<C-J>'
let g:UltiSnipsJumpBackwardTrigger = '<C-K>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories = ['~/macos.cfg/.ultisnips/']
noremap <LEADER>; <ESC>:UltiSnipsEdit<CR><C-W>H

""""""
"""""" file manager
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
set rtp+=/home/lorenzo
nnoremap <LEADER>f :Files ~<CR>
nnoremap <LEADER>h :History<CR>
" CTRL-T  -- open selected files in current window
" CTRL-X  -- open selected files in new tabs
" CTRL-V  -- open selected files in vs split

" :Files [PATH]     - Files (runs $FZF_DEFAULT_COMMAND if defined)
" :GFiles [OPTS]    - Git files (git ls-files)
" :GFiles?          - Git files (git status)
" :Buffers          - Open buffers
" :Colors           - Color schemes
" :Ag [PATTERN]     - ag search result (ALT-A to select all, ALT-D to deselect all)
" :Rg [PATTERN]     - rg search result (ALT-A to select all, ALT-D to deselect all)
" :Lines [QUERY]    - Lines in loaded buffers
" :BLines [QUERY]   - Lines in the current buffer
" :Tags [QUERY]     - Tags in the project (ctags-R)
" :BTags [QUERY]    - Tags in the current buffer
" :Marks            - Marks
" :Windows          - Windows
" :Locate PATTERN   - locate command output
" :History          - v:oldfiles and open buffers
" :History:         - Command history
" :History/         - Search history
" :Snippets         - Snippets (UltiSnips)
" :Commits          - Git commits (requires fugitive.vim)
" :BCommits         - Git commits for the current buffer
" :Commands         - Commands
" :Maps             - Normal mode mappings
" :Helptags         - Help tags 1
" :Filetypes        - File types

""""""
"""""" file navigation
Plug 'preservim/nerdtree'
let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeWinSize=24
let NERDTreeIgnore=['\.git$','\.swp$','\.DS_Store$']
let g:DTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = '/'
autocmd StdinReadPre * let s:std_in=1
" open a nerdtree automatically when vim starts up if no files were specified
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" do not open, or can not use startify
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " close vim when only nerdtree left
nnoremap \[ :NERDTreeToggle<CR>

Plug 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_case_insensitive = 1
let g:tagbar_iconchars = ['/', '|']
let g:tagbar_visibility_symbols = {
            \ 'public'    : '/',
            \ 'protected' : '^',
            \ 'private'   : '*'
            \ }
let g:tagbar_width = max([24, winwidth(0) / 5])
nnoremap \] :TagbarToggle<CR>

""""""
"""""" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
" :Git             ~ :!git 

Plug 'junegunn/gv.vim'

""""""
"""""" undotree: ": Z 
Plug 'mbbill/undotree'
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
noremap ZZ <nop>
noremap Z :UndotreeToggle<CR>

""""""
"""""" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme= 'transparent'

""""""
"""""" secret
Plug 'ernstwi/vim-secret'
" :sectet to enter secret mode
" :Secret  (line | word | char | none)
" :sectet! to exit secret mode

"""""" !!!
"""""" multi editing :help visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

""""""
"""""" repeat dot .
Plug 'tpope/vim-repeat'
" The following plugins support repeat.vim:
" - surround.vim
" - speeddating.vim
" - unimpaired.vim
" - vim-easyclip
" - vim-radical

"""""" !!!
"""""" vim-surround
Plug 'tpope/vim-surround'

"""""" !!!
"""""" text object: https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

"""""" !!!
"""""" wildfire and surround
" powerful Enter key
Plug 'gcmt/wildfire.vim'

"""""" !!!
"""""" ctrl-a/ctrl-x to decrease or increase date, time and more
Plug 'tpope/vim-speeddating'

"""""" !!!
"""""" vim-commentary
Plug 'tpope/vim-commentary'

"""""" !!!
"""""" :h tabular
Plug 'godlygeek/tabular'
" :Tabularize /=<CR>
vnoremap tt :Tabularize /
" note: visual mode and normal mode not confilct

""""""
"""""" find & replace
Plug 'tpope/vim-abolish'
" :%S/facilit{y,ies}/building{,s}/g

""""""
"""""" incsearch
Plug 'haya14busa/incsearch.vim'

""""""
"""""" splitjoin
Plug 'andrewradev/splitjoin.vim'
" gS to split one-line to multiple lines
" gJ to join block to single line

"""""" !!!
"""""" interesting words
Plug 'lfv89/vim-interestingwords'
nnoremap <silent> <LEADER>k :call InterestingWords('n')<cr>
nnoremap <silent> <LEADER>l :call UncolorAllWords()<cr>
nnoremap <silent> n :call wordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>

"""""" !!!
"""""" pair parentheses
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'  ],
            \ ['Darkblue',    'SeaGreen3'   ],
            \ ['darkgray',    'DarkOrchid3' ],
            \ ['darkgreen',   'firebrick3'  ],
            \ ['darkcyan',    'RoyalBlue3'  ],
            \ ['darkred',     'SeaGreen3'   ],
            \ ['darkmagenta', 'DarkOrchid3' ],
            \ ['brown',       'firebrick3'  ],
            \ ['gray',        'RoyalBlue3'  ],
            \ ['darkmagenta', 'DarkOrchid3' ],
            \ ['Darkblue',    'firebrick3'  ],
            \ ['darkgreen',   'RoyalBlue3'  ],
            \ ['darkcyan',    'SeaGreen3'   ],
            \ ['darkred',     'DarkOrchid3' ],
            \ ['red',         'firebrick3'  ],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" Always On:
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RqainbowParenthesesLoadRound;
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

""""""
"""""" colorschema
Plug 'zetatez/ambre'
Plug 'flazz/vim-colorschemes'

"""""" !!!
"""""" Goyo
Plug 'junegunn/goyo.vim'
let g:goyo_width=120
let g:goyo_height=85
nnoremap gh :Goyo<CR>

"""""" !!!
"""""" lime light
Plug 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" default: 0.5
let g:limelight_default_coefficient = 0.618
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 3
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = 10
" Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
vnoremap <LEADER>/ <Plug>(Limelight)
nnoremap  <LEADER>/ :Limelight!!<CR>

""""""
"""""" bookmarks
Plug 'MattesGroeger/vim-bookmarks'
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
" Add/remove bookmark at current line	        mm         :BookmarkToggle
" Add/edit/remove annotation at current line	mi         :BookmarkAnnotate <TEXT>
" Jump to next bookmark in buffer	            mn         :BookmarkNext
" Jump to previous bookmark in buffer	        mp         :BookmarkPrev
" Show all bookmarks (toggle)	                ma         :BookmarkShowAll
" Clear bookmarks in current buffer only	    mc         :BookmarkClear
" Clear bookmarks in all buffers	            mx         :BookmarkClearAll
" Move up bookmark at current line	            [count]mkk :BookmarkMoveUp [<COUNT>]
" Move down bookmark at current line	        [count]mjj :BookmarkMoveDown [<COUNT>]
" Move bookmark at current line to another line	[count]mg  :BookmarkMoveToLine <LINE>
" Save all bookmarks to a file                             :BookmarkSave <FILE_PATH>
" Load bookmarks from a file                               :BookmarkLoad <FILE_PATH>

""""""
""""""" for general writing
Plug 'reedes/vim-wordy'
" uncover usage problems in your writing
Plug 'ron89/thesaurus_query.vim'
" multi-language thesaurus query and replacement 
Plug 'reedes/vim-pencil'

""""""
"""""" 16 bit editor
Plug 'shougo/vinarise.vim'

""""""
"""""" databases
Plug 'tpope/vim-dadbod'
Plug 'evanthegrayt/vim-lovehandle'
" :help lovehandle-project-specific-vimrc-setup
" Obviously, in a real-world example, all the URLs would be different.
let g:lovehandle_list = [
            \   ['dev',             'mysql://root:root@localhost:3306/dev'],
            \   ['pro',             'postgres://user:password@host:port/database'],
            \   ['mysql',           'mysql://root:root@localhost:3306/das'],
            \ ]
let g:lovehandle_default_database = 'dev'
" :LHSwitch! pro

""""""
"""""" web api
Plug 'mattn/webapi-vim'

""""""
"""""" markdown
" turn off anything you do not need, which will slow down the speed
Plug 'plasticboy/vim-markdown'
"" fold
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_folding_level = 6
" - 'zr': reduces fold level throughout the buffer   * vim-markdown-zr *
" - 'zR': opens all folds                            * vim-markdown-zR *
" - 'zm': increases fold level throughout the buffer * vim-markdown-zm *
" - 'zM': folds everything all the way               * vim-markdown-zM *
" - 'za': open a fold your cursor is on              * vim-markdown-za *
" - 'zA': open a fold your cursor is on recursively  * vim-markdown-zA *
" - 'zc': close a fold your cursor is on             * vim-markdown-zc *
" - 'zC': close a fold your cursor is on recursively * vim-markdown-zC *
" toc auto-fit
let g:vim_markdown_toc_autofit = 0
" syntax concealing
let g:vim_markdown_conceal = 0
set conceallevel=2

Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
    
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
let g:mkdp_path_to_chrome = "/Applications/Safari.app"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" key map
nnoremap <C-p> <Plug>MarkdownPreviewToggle

Plug 'dkarter/bullets.vim'
" in markdown or a text file start a bulleted list using - or *. press return to go to the next line, a new list item will be created.
let g:bullets_set_mappings = 1
" choose which file types this plugin will work on
let g:bullets_enabled_file_types = ['text', 'gitcommit']

Plug 'ferrine/md-img-paste.vim'
let g:mdip_imgdir = 'pic'
let g:mdip_imgname = 'image'

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" You can use the following to quickly enable / disable table mode in insert mode by using || or __:
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape((&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
inoreabbrev <expr> <bar><bar> <SID>isAtStartOfLine('\|\|') ? '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __ <SID>isAtStartOfLine('__') ? '<c-o>:silent! TableModeDisable<cr>' : '__'
let g:table_mode_corner='|'
" As long as table mode has troggled, then you can use this powerful feature
nnoremap \t :TableModeToggle<cr>

" do not use !!!
" Plug 'vim-pandoc/vim-pandoc'
" " provide facilities to integrate vim with the pandoc document converter and work with documents written in its markdown variant
" " requirements: vim 7.4/neovim/python 3/pandoc 2.x
" Plug 'vim-pandoc/vim-pandoc-syntax'

""""""
"""""" tex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
            \ 'executable' : 'latexmk',
            \ 'options' : [
                \   '-xelatex',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
set conceallevel=0
let g:tex_conceal='abdmg'

""""""
"""""" bash
" Write BASH-scripts by inserting comments, statements, tests, variables, builtins, etc..
" Speed up writing new scripts considerably.
Plug 'vim-scripts/bash-support.vim'

"""""" c++
""""""
Plug 'octol/vim-cpp-enhanced-highlight'

""""""";
""""""" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"" :GoUpdateBinaries
"" :GoInstallBinaries
let g:go_fmt_command = "goimports"
"" let g:go_snippet_engine = "ultisnips"
"" prevent integrated ultisnips
let g:go_snippet_engine = 0
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

cnoremap gg Go

"" go get -u golang.org/x/lint/golint
"Plug 'golang/lint', { 'for': ['go', 'vim-plug'] }
"set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
"" :Lint
"" optionally, add this to your ~/.vimrc to automatically run golint on :w
"" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

""""""
"""""" scala
Plug 'derekwyatt/vim-scala', { 'for' :['scala', 'vim-plug'] }

""""""
"""""" julia
Plug 'julialang/julia-vim', { 'for' :['julia', 'vim-plug'] }

""""""
"""""" python
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" :help pymode

Plug 'google/yapf'
Plug 'nvie/vim-flake8'
" a vim plugin that runs the currently open file through flake8, a static syntax and style checker for python source code

""""""
"""""" csharp
" Plug 'OmniSharp/omnisharp-vim'
" let g:OmniSharp_typeLookupInPreview = 1
" let g:omnicomplete_fetch_full_documentation = 1
" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'ctrlp'

""""""
"""""" swift
" Plug 'keith/swift.vim'
" Plug 'arzg/vim-swift'

""""""
"""""" typescript: js, object
Plug 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1
autocmd FileType typescript :set makeprg=tsc


"""""
""""" xml, css, html, css, php, etc.
Plug 'mattn/emmet-vim'
" https://emmet.io
" emmet is a plugin for many popular text editors which greatly improves html & css workflow

Plug 'othree/html5.vim', {'for': 'html'}
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

Plug 'othree/xml.vim', {'for': 'xml'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'ap/vim-css-color', {'for': 'css'}

""""""
"""""" docker
" Plug 'ekalinin/dockerfile.vim'
" Plug 'kevinhui/vim-docker-tools'

""""""
"""""" json
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

""""""
"""""" csv: powerful csv tool
Plug 'chrisbra/csv.vim', {'for': ['csv']}

""""""
"""""" pdf: just open pdf with vim
Plug 'makerj/vim-pdf', {'for': ['pdf']}

""""""
"""""" formatter
"" google/vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" used to configure codefmt's maktaba flags. see `:help :Glaive` for usage.
" automformat
augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " alternative: autocmd filetype python autoformatbuffer autopep8
  " autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

"""""" Chiel92/vim-autoformat
" need to install autopep8: pip install autopep8
Plug 'Chiel92/vim-autoformat'
" provide easy code formatting in vim by integrating existing code formatters.
" python3 -m pip install pynvim
" autocmd BufWrite * :Autoformat
nnoremap \f :Autoformat<CR>

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
autocmd FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
" <LEADER>P               " prettier by default will run on auto save but can also be manually triggered by
" :Prettier;

""""""
"""""" syntax checking: slow the the vim open speed
" need to install flake8: pip install flake8
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_python_checkers = ['python']

""""""
"""""" debug
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-go --enable-bash --enable-python'}
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'vscode-go', 'vscode-python', 'vscode-bush-debug', 'debugger-for-chrome', 'CodeLLDB' ]
let g:vimspector_enable_mappings = 'HUMAN'
sign define vimspectorBP         text=*   texthl=Normal
sign define vimspectorBPDisabled text=+   texthl=Normal
sign define vimspectorPC         text=-   texthl=SpellBad
sign define vimspectorBPCond     text=_   texthl=WarningMsg
sign define vimspectorPCBP       text=>   texthl=MatchParen
let g:vimspector_sidebar_width = 80
let g:vimspector_bottombar_height = 15
" shortcut
" F5           <Plug>VimspectorContinue
" F3           <Plug>VimspectorStop
" F4           <Plug>VimspectorRestart
" F6           <Plug>VimspectorPause
" F9           <Plug>VimspectorToggleBreakpoint
" <leader>F9   <Plug>VimspectorToggleConditionalBreakpoint
" F8           <Plug>VimspectorAddFunctionBreakpoint
" <leader>F8   <Plug>VimspectorRunToCursor
" F10          <Plug>VimspectorStepOver
" F11          <Plug>VimspectorStepInto
" F12          <Plug>VimspectorStepOut

  " for go lang debuger
  " go get -u github.com/go-delve/delve/cmd/dlv
  "
  " for python lang debuger
  " pip install debugpy

""""""
"""""" auto complete
Plug 'codota/tabnine-vim'
Plug 'wellle/tmux-complete.vim'

""""""
"""""" other visual enhancement
Plug 'ryanoasis/vim-devicons'
" need nerd-font
" brew tap homebrew/cask-fonts
" brew install font-hack-nerd-font --cask

Plug 'mg979/vim-xtabline'
" tabline customization with buffer filtering
" brew install coreutils
" :help xtabline.txt

""
""""""
"""""" denite.nvim
" pip3 install --user pynvim
if has('nvim')
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
Plug 'Shougo/denite.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
endif
    
""""""
"""""" my vim plug
Plug 'zetatez/vim-alt'

call plug#end()
"-------------------------------------------------------
" :w
" :source %
" :PlugInstall
" :q
"-------------------------------------------------------
" |   vim-plug end                                     |
"-------------------------------------------------------


"-------------------------------------------------------
" |   basic start           flag=f3                   |
"-------------------------------------------------------
" :h option-list        show all parameters that can be configured
" :set <parameter>?     show current status of the parameter
" :set <parameter>&     reset parameter to default value

""""""
"""""" behavior
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5
set history=10000
set maxmempattern=10000
set secure
set exrc
set ttyfast
set autochdir
set autoread
set autowrite
set errorbells
set visualbell
" set paste                                     " do not set, or jk <ESC> map will not work
set splitbelow splitright
set lazyredraw
set viewoptions=cursor,folds,slash,unix
set path=.,/usr/include,~/go                    " directories which will be searched when using: gf, [f, ]f, ^Wf, :find, :sfind, :tabfind...
syntax on
""""""

"""""" UI
set number
set relativenumber
set showcmd
set noshowmode
set ruler
set scrolloff=3
" set list
" set listchars=tab:\.\ ,trail:<
set showmatch
set matchpairs+=<:>
set showmatch
set cmdheight=2
set cmdwinheight=5
set display=lastline
set hidden
set mousehide
set wildmenu
set wildmode=full

""""""
"""""" set cursorline/cursorcolum will slow down the vi startup
function! ToggleCursorsLC() abort
    set cursorline!
    " set cursorcolumn!
endfunction
autocmd InsertLeave * call ToggleCursorsLC()
autocmd InsertEnter * call ToggleCursorsLC()

""""""
"""""" colorscheme
" colorscheme Chasing_Logic
" colorscheme sift
colorscheme ambre

""""""
"""""" fold
" set nofoldenable
set foldenable
set foldmethod=indent
set foldlevel=2

""""""
"""""" searching
set infercase
set wrapscan
set hlsearch incsearch

""""""
"""""" tabs, indents, wrap
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set backspace=2
set shiftround
set autoindent
set smartindent
set formatoptions-=t
set formatoptions+=1
set formatoptions-=o
set nowrap
set textwidth=0

""""""
"""""" acceleration
set timeoutlen=400
set ttimeoutlen=0
" ttimeoutlen    mapping delay      key code delay
"    < 0        'timeoutlen'       'timeoutlen'
"   >= 0        'timeoutlen'       'ttimeoutlen'        *

""""""
"""""" always back to the last cursor
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

""""""
"""""" map <Esc> as jk in inerst mode. Note: if set paste jk will be invalid
" do not map in norm mode, it will low down the jk speed
" inoremap <ESC> <nop>
inoremap jk <ESC>

""""""
"""""" <ESC> and jk kj
" map <ESC>: as kj in insert mode
" map <ESC>: as ik in cmd mode
inoremap kj <ESC>:
cnoremap jk <ESC>i
" then you can try kj in inerst mode, kj in cmd mode

""""""
"""""" exchange : and ; in normal mode
" note: do not use nmap : ;, when use f jumps from char, ; will not performance will
nnoremap ; :
nnoremap : ;

""""""
"""""" zen mode
nnoremap <C-c> zz
" Ctrl + U or D will move up/down the view port without moving the cursor
nnoremap <C-u> 5<C-y>
nnoremap <C-d> 5<C-e>

""""""
"""""" tab
nnoremap tt :tabnew<CR>
nnoremap to :tabonly<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>

""""""
"""""" :bn :bp
noremap <LEADER>, <ESC>:bn<CR>
noremap <LEADER>. <ESC>:bp<CR>

""""""
"""""" pane split, save, quit
" disable the default s key
nnoremap s <nop>

"""""" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>;
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap sl :set splitright<CR>:vsplit<CR>

""""""" place the two screens up and down, place the two screens side by side
nnoremap s- <C-w>t<C-w>K
nnoremap s= <C-w>t<C-w>H

"""""" rotate screens
nnoremap s, <C-w>b<C-w>K
nnoremap s. <C-w>b<C-w>H

"""""" jump from panes
nnoremap <C-h>  <C-w><C-h>
nnoremap <C-j>  <C-w><C-j>
nnoremap <C-k>  <C-w><C-k>
nnoremap <C-l>  <C-w><C-l>

"""""" terminal
" switch to normal mode with <C-c>
tnoremap <C-x> <C-W>N
" mappings to move out from terminal to other views
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
" open terminal in vertical, horizontal and new tab
nnoremap <LEADER>t :set splitbelow<CR>:term ++rows=18<CR>
nnoremap <LEADER>v :set splitright<CR>:vsplit<CR>:term ++curwin<CR>
nnoremap <leader>st :tabnew<cr>:term ++curwin<CR>
nnoremap <LEADER>sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>:term ++curwin<CR>
nnoremap <LEADER>sj :set splitbelow<CR>:split<CR>:term ++curwin<CR>
nnoremap <LEADER>sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>:term ++curwin<CR>
nnoremap <LEADER>sl :set splitright<CR>:vsplit<CR>:term ++curwin<CR>

"""""" resize pane
nnoremap <up>    :res +3<CR>
nnoremap <down>  :res -3<CR>
nnoremap <left>  :vertical resize+3<CR>
nnoremap <right> :vertical resize-3<CR>

"""""" quit, svae, exchange pane
nnoremap <LEADER>q <C-w>j:q<CR>
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>e <ESC><C-w>x<CR>

""""""
"""""" command mode cursor movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <S-Left>
cnoremap <C-w> <S-Right>

""""""
"""""" registers
nnoremap r :reg<CR>
nnoremap \0 "0p
nnoremap \1 "1p
nnoremap \2 "2p
nnoremap \3 "3p
nnoremap \4 "4p
nnoremap \5 "5p
nnoremap \6 "6p
nnoremap \7 "7p
nnoremap \8 "8p
nnoremap \9 "9p
nnoremap \* "*p
nnoremap \= "+p

""""""
"""""" sudo write
cnoremap ww w !sudo tee % >/dev/null

""""""
"""""" jump to the next
nnoremap <LEADER><LEADER> <ESC>n

""""""
"""""" map y$ to Y
nnoremap Y y$

""""""
"""""" copy to system clipboard
vnoremap Y "+y

""""""
"""""" faster in-line navigation
nnoremap W 5w
nnoremap B 5b

""""""
"""""" 0/$
nnoremap ( 0
nnoremap ) $
vnoremap ( 0
vnoremap ) $

" n/N 
nnoremap n nzzzv
nnoremap N Nzzzv

""""""
"""""" see changes
function! DiffWithFileFromDisk()
    let filename=expand('%')
    let diffname = filename.'.fileFromBuffer'
    exec 'saveas! '.diffname
    diffthis
    vsplit
    exec 'edit '.filename
    diffthis
endfunction
nmap \d :call DiffWithFileFromDisk()<CR>

""""""
"""""" build ctags for go to definition, you can add your project folder at any time
set tags=~/tags
nnoremap \g :!ctags -R . >> /dev/null 2>&1 &<CR><CR>
" C-]         " go to definition
" C-T         " back

""""""
"""""" to cmds
nnoremap te :!
nnoremap tr :r!
" nnoremap ty <ESC>yyq:p<ESC>Ir! <ESC>A<CR><ESC>:w<CR><ESC>o<ESC>j
nnoremap tf :r !figlet 

""""""
"""""" lower/upper current line
noremap tu <S-v>gU
noremap tl <S-v>gu

""""""
"""""" upper the firt char of the current word
noremap <C-Q> vawbgUw
inoremap <C-Q> <ESC>vawbgUw

""""""
"""""" space to tab
cnoremap stt :%s/    /\t/g
cnoremap tts :%s/\t/    /g

""""""
"""""" ss normal/visual mode to replace
nnoremap ss :%s/<C-R><C-W>/
vnoremap ss :s/
" example
" <S-V> select some lines, then press ss

""""""
"""""" norm cmd in visual mode
vnoremap nn :norm
" example
" <S-V> select some lines, then press nn

""""""
"""""" double qq trigger @q ???, non existent !!!, more powerful to use qq
nnoremap qq :wq<CR>
""""""
"""""" search current word
nnoremap <C-S> /<C-R><C-W>

""""""
"""""" set wrap
noremap <LEADER>sw :set wrap<CR>

""""""
"""""" spell check
noremap <LEADER>sc :set spell!<CR>
noremap <LEADER>sn :set nospell!<CR>

""""""
"""""" clever tab
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

""""""
"""""" expand path with %%
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
" try
" :vs %%
" will expand to
" :vs ./

""""""
"""""" use <LEADER><CR> to remove the highlight after search
nnoremap <LEADER>n :let @/ = ""<CR>:<BACKSPACE>

""""""
""""""  vimrc/zshrc
nnoremap ,. :vs ~/.vimrc<CR>
nnoremap ., <ESC>:update<CR>:source ~/.vimrc<CR>

nnoremap ,z :vs ~/.zshrc<CR>
nnoremap z, <ESC>:!source ~/.zshrc<CR><CR>

""""""
"""""" open broswer to search something
noremap bw :!open http://www.baidu.com &<CR><CR>
noremap wb :!w3m "https://cn.bing.com/search?q=<C-R><C-W>"<CR><CR>

"""""
""""" compile and run: c/c++/python/shell
nnoremap <LEADER>b :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        set splitbelow
        :term ./%
    elseif &filetype == 'cpp'
        exec "!g++ -std=c++11 % -Wall -o %<"
        set splitbelow
        set splitbelow
        :term ./%
    elseif &filetype == 'go'
        set splitbelow
        :term go run %
        ;res +6
    elseif &filetype == 'python'
        set splitbelow
        :term python %
        ;res +6
    elseif &filetype == 'julia'
        set splitbelow
        :term julia %
        ;res +6
    elseif &filetype == 'sh'
        set splitbelow
        :term bash %
        ;res +6
    elseif &filetype == 'markdown'
        exec "InstantMarkdownPreview"
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    endif
endfunc;

""""""
"""""" vim-plug
cnoremap ppi PlugInstall
cnoremap ppc PlugClean
cnoremap ppd PlugDiff
cnoremap ppu PlugUpdate
cnoremap pps PlugSnapshot

""""""
"""""" http request: curl get/post
cnoremap 'g term curl -i -s -H "Content-Type:application/json" -d '{"key": "value"}' https://
cnoremap 'p term curl -i -s X POST -H "Content-Type:application/json" -d '{"key": "value"}' https://

""""""
"""""" lazygit
nnoremap <LEADER>g :!clear; lazygit<CR><CR>
cnoremap ;g !clear; lazygit<CR><CR>

""""""
"""""" weather
nnoremap <LEADER>w :!clear; curl wttr.in/shanghai; finger shanghai@graph.no<CR>
cnoremap ;w :!clear; curl wttr.in/shanghai; finger shanghai@graph.no<CR>

""""""
"""""" open pdf with zathura
cnoremap ;z !zathura $(fzf)<CR>

""""""
"""""" for taskwarrior
" brew install task
nnoremap <LEADER>y :! clear; task summary; task ghistory; task calendar; task list <CR>
cnoremap ;t !task 

cnoremap 'a !clear; task add 
cnoremap 'e !clear; task edit 
cnoremap 'm !clear; task modify 
cnoremap 'j !clear; task project:
cnoremap '[ !clear; task start 
cnoremap '] !clear; task stop 
cnoremap '\ !clear; task done 
cnoremap 'r !clear; task ready 
cnoremap 'w !clear; task waiting 
cnoremap 'l !clear; task list<CR>
cnoremap 'n !clear; task next<CR>
cnoremap 't !clear; task due:today list<CR>
cnoremap 'u !clear; task due.any: list<CR>
"ts:summary
cnoremap 's !clear; task summary; task ghistory; tark burndown.daily; task calendar <CR>
"tf:filter
cnoremap 'f !clear; echo "task project:home and -work status:pending /pattern/ list"; task
"t1:template
cnoremap '1 !clear; echo "task add Send Alice a birthday card due:2016-11-08 scheduled:due-4d wait:due-7d until:due+2d"; task add

""""""
"""""" timewarrior
" brew install timewarrior
nnoremap <LEADER>z :!clear; timew month<CR>
cnoremap ;i !timew 
" cnoremap 'd !clear; timew day<CR>;
" cnoremap 'w !clear; timew week<CR>
" cnoremap 'm !clear; timew month<CR>

"-------------------------------------------------------
" |   basic end                                        |
"-------------------------------------------------------



"-------------------------------------------------------
" |   my plugins                                       |
"-------------------------------------------------------
" Plug 'zetatez/vim-alt'
"
" The vim-alt key ^[

" ----------------------------------
"  vim alt key
" ----------------------------------
"""""" move line/lines up/down
noremap u dd2kp
noremap d ddp
vnoremap u :m '<-2<CR>gv=gv
vnoremap d :m '>+1<CR>gv=gv

"""""" add/delete previous/next line
nnoremap p <ESC>O<ESC>j$
nnoremap n <ESC>o<ESC>k$
nnoremap P <ESC>kdd
nnoremap N <ESC>jddk

nnoremap ap <ESC>O<ESC>j$
nnoremap an <ESC>o<ESC>k$
nnoremap dp <ESC>kdd
nnoremap dn <ESC>jddk

"""""" insert mode cursor movement
inoremap h <ESC>I
inoremap l <ESC>A
inoremap k <ESC>ddi
inoremap d <ESC>DA
inoremap c <ESC>v0xI

inoremap <C-h> <ESC>I
inoremap <C-l> <ESC>A
inoremap <C-k> <ESC>ddi
inoremap <C-d> <ESC>DA
inoremap <C-c> <ESC>v0xI

"""""" upper/lowwer current word
noremap w <ESC>vawgUi
noremap s <ESC>vawgui

"""""" add "" or '' to the current word
nnoremap " viw<ESC>a"<ESC>bi"<ESC>lel
nnoremap ' viw<ESC>a'<ESC>bi'<ESC>lel
nnoremap ( viw<ESC>a )<ESC>gvo<ESC>i( <ESC>wwi
nnoremap 9 viw<ESC>a ]<ESC>gvo<ESC>i[ <ESC>wwi
nnoremap 0 viw<ESC>a }<ESC>gvo<ESC>i{ <ESC>wwi
nnoremap < viw<ESC>a ><ESC>gvo<ESC>i< <ESC>wwi
nnoremap > viw<ESC>a 》<ESC>gvo<ESC>i《 <ESC>wwi

"""""" comment/uncomment with // or # 
nnoremap / mqI// <ESC>`q
nnoremap ? mqV:s/\v^\/\/ //<CR><ESC>`q
vnoremap / :norm I// <ESC>gv
vnoremap ? :s/\v^\/\/ //<CR><ESC>gv

nnoremap 3 mqI# <ESC>`q
nnoremap # mqV:s/\v^\# //<CR><ESC>`q
vnoremap 3 :norm I# <ESC>gv
vnoremap # :s/\v^\# //<CR><ESC>gv

nnoremap 8 mqI/* <ESC>A */<ESC>'q
nnoremap * mqV:s/\v^\/\* //<CR>V:s/\v \*\/$//<CR><ESC>'q
vnoremap 8 o<ESC>O/*<ESC>gvo<ESC>o*/<ESC>gvjok
vnoremap * :s/\v^\/\*$//<CR>gv:s/\v^\*\/$//<CR>

"""""" add a ; or . at then end of the line
nnoremap ; mqA;<ESC>`q
nnoremap . mqA.<ESC>`q

"""""" for markdown
nnoremap - mqI- <ESC>`q
nnoremap _ mqV:s/\v^- //<CR><ESC>'q

"""""" copy, copy to system clipboard
nnoremap y y$
vnoremap y "+y

"""""" find duplicate words/lines
nnoremap = /\(\<\w\+\>\) *\1\><CR>
nnoremap + /^\(.\+\)$\n\1$<CR>

cnoremap dw /\(\<\w\+\>\) *\1\><CR>
cnoremap dl /^\(.\+\)$\n\1$<CR>

"""""" indent
" hard indent
nnoremap < V:s/^    //<CR>
vnoremap > :norm 0i    <CR><ESC>gv
vnoremap < :s/^    //<CR><ESC>gv
nnoremap > :norm 0i    <CR>

" soft indent
nnoremap < <<
nnoremap > >>
vnoremap < <<<ESC>gv
vnoremap > >><ESC>gv


