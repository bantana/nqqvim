" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'garyburd/go-explorer'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'cespare/vim-toml'
Plug 'gagoar/StripWhiteSpaces'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'wannesm/wmgraphviz.vim'
Plug 'thinca/vim-quickrun', { 'tag': 'v0.7.0' }
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/gina.vim'
Plug 'mattn/emmet-vim'
Plug 'corylanou/vim-present'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" javascript {{{
Plug 'ternjs/tern_for_vim', { 'do': 'yarn install && yarn global add tern' }
" typescript lang
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
 \ 'do': 'yarn install',
 \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown']}
Plug 'Valloric/YouCompleteMe'
" Initialize plugin system
call plug#end()

"Pathogen configuration
"execute pathogen#infect()

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
syn on
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

" set number                        " Show line numbers.
set relativenumber
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

" set tabstop=4

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

" Setting shell for vim
set shell=sh

" Syntax Completion
filetype plugin on
set ofu=syntaxcomplete#Complete

" syntastic
let g:syntastic_go_checkers = []

" Supertab
let g:SuperTabDefaultCompletionType = "context"

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=.,$TEMP  " Keep swap files in one location
set backupdir=.,$TEMP  " Keep swap files in one location

" UNCOMMENT TO USE
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" NERDTree
let NERDTreeShowHidden=0

" " CtrlP
if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and
        " respects .gitignore
        let g:ctrlp_user_command = 'ag -i %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
endif

" Color Scheme
set t_Co=256
set background=dark
hi Search term=reverse cterm=reverse gui=reverse ctermfg=237
" color Tomorrow-Night
" color gruvbox
colorscheme gruvbox

" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" mapleader
let mapleader = ","
let maplocalleader = "\\"

"inoremap jj <Esc>
"imap jj <Esc>
inoremap jj <Esc>
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap `` <ESC>:bn<cr>
nnoremap <leader>w :w<cr>
" Splitting
map <Leader>- :split<CR>
map <Leader><bar> :vsplit<CR>


map <leader>n :NERDTreeToggle<cr>
map <leader>g :Git<Space>
" map <leader>c :CtrlPClearAllCaches<cr>
map <leader>/ :Ack<Space>
map <leader>p :YRShow<cr>

" Removing search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR>

" split naviagation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Zencoding
let g:user_zen_expandabbr_key='<C-e>'
let g:user_zen_settings = { 'erb': { 'extends': 'html' } }

" disable arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Relative line numbers
function! NumberToggle()
        if(&relativenumber == 1)
                set number
        else
                set relativenumber
        endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" swift source_kitten
" let g:deoplete#sources#swift#source_kitten_binary = '/usr/local/bin/sourcekitten'
" let g:deoplete#sources#swift#daemon_autostart = 1

" autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

" pbcopy
set clipboard=unnamed

" swiftformat
" nnoremap <leader>F :!swiftformat %<cr>
" au FileType swift nmap <leader>r :QuickRun swiftrun<cr>
" au FileType swift nmap <leader>t :QuickRun swifttest<cr>

nmap <leader>p :setlocal paste! paste?<cr>
" quickrun
let g:quickrun_config = {
\    "_" : {
\        "outputter" : "message",
\    },
\}

" python3 ---------------------------------- {{{
let g:python3_host_skip_check=1
"let g:python3_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" }}}
" YouCompleteMe ---------------------------- {{{
let g:ycm_auto_trigger=1
 "let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全"
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 0 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_collect_identifiers_from_tags_files=1  " 开启 YCM 基于标签引擎"
let g:ycm_complete_in_comments= 1 "default 1
"let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
" }}}
" YouCompleteMe ultisnips ------------------ {{{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}.
" YouCompleteMe {{{
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 比较喜欢用tab来选择补全...
function! MyTabFunction ()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if strlen(substr) == 0
        return "\<tab>"
    endif
    return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction
inoremap <tab> <c-r>=MyTabFunction()<cr>
" }}}

" vim-mundo ------- {{{
set undofile
set undodir=~/.vim/undo
nnoremap <leader>u :MundoToggle<CR>
let g:mundo_debug = 1
let g:mundo_preview_bottom = 1
let g:mundo_tree_statusline = "Mundo"
let g:mundo_preview_statusline = "Mundo Preview"
" }}}

" Tabs, spaces, wrapping ------------------- {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=110 "80-width lines is for 1995"
let &wrapmargin=&textwidth
set formatoptions=qrn1
set nu
set ic
" }}}
" vim-go ---------------------------------------- {{{

"------------------------------------------------------------------------------
" Vim-go
"------------------------------------------------------------------------------
" let g:go_fmt_fail_silently = 1
" let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
"au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" }}}
" " vim-go ----------------------------------- {{{
  let g:go_auto_type_info=1
  let g:go_fmt_autosave = 1
  let g:go_fmt_command = "goimports"
  let g:go_goimports_bin = "goimports -tabs=false -tabwidth=4"
  let g:go_fmt_fail_silently = 1
  let g:go_fmt_experimental = 1
  let g:go_doc_keywordprg_enabled = 1
  " let g:go_bin_path = expand("~/bin")
  let g:go_bin_path = $HOME."/bin"
  let g:go_highlight_array_whitespace_error = 1
  let g:go_highlight_chan_whitespace_error = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_space_tab_error = 1
  let g:go_highlight_trailing_whitespace_error = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_build_constraints = 1
  let g:go_snippet_engine = "ultisnips"

  let g:go_metalinter_autosave = 1
  "let g:go_metalinter_autosave_enabled = ['vet', 'golint']
  "let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
  " shortkey
  " au FileType go nmap <Leader>s <Plug>(go-implements)
  nnoremap <leader>es :vsplit ~/.vim/plugged/vim-snippets/snippets/

  set invsplitbelow
  let g:go_term_mode = "split"
  let g:go_term_enabled = 1
  "let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
  let g:syntastic_go_checkers = ['gometalinter']
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  let g:go_list_type = "quickfix"
  nnoremap <leader>m :TagbarToggle<CR>
" }}}.
" fzf -------------------------------------- {{{
set rtp+=/usr/local/opt/fzf
nnoremap <silent> <leader>gg :FZF<cr>
" }}}
" statusline ------------------------------- {{{
set statusline=...%{MyGitStatus()}...

function! MyGitStatus() abort
  let staged = gina#component#status#staged()
  let unstaged = gina#component#status#unstaged()
  let conflicted = gina#component#status#conflicted()
  let branched = gina#component#repo#branch()
  return printf(
        \ 'b: %s, s: %s, u: %s, c: %s',
        \ branched,
        \ staged,
        \ unstaged,
        \ conflicted,
        \)
endfunction
"set statusline=
set statusline=[%n]\                           "buffernr
set statusline+=%<%F\                          "File+path
set statusline+=%y\                            "FileType
set statusline+=%{ALEGetStatusLine()}\         "ale status"
set statusline+=%{fugitive#statusline()}\      "fugitive#statusline"
set statusline+=%{MyGitStatus()}
set statusline+=%=                             "right alignment
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]  "file encoding
set statusline+=%-16(\ %l,%c-%v\ %)\ %P         "cursor row, col, Percentage
" }}}
" typescript lang------------------------------ {{{
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" }}}
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>

" " Prettier
" nmap <leader>py <Plug>(Prettier)
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#config#bracket_spacing = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" ctrlp ------------------------ {{{
" +++ CtrlP +++
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 10
let g:ctrlp_mruf_max = 250
"  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
" \ 'dir': '^build$\|^node_modules$',
" \ 'dir':  '\v[\/](^node_modules$)|(\.(git|hg|svn|build))$',
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

func! MyPrtMappings()
  let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }
endfunc

func! MyCtrlPTag()
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
\ 'AcceptSelection("t")': ['<c-t>'],
\ }
CtrlPBufTag
endfunc

let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
com! MyCtrlPTag call MyCtrlPTag()

let g:ctrlp_buftag_types = {
\ 'go'         : '--language-force=go --golang-types=ftv',
\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
\ 'markdown'   : '--language-force=markdown --markdown-types=hik',
\ 'objc'       : '--language-force=objc --objc-types=mpci',
\ 'rc'         : '--language-force=rust --rust-types=fTm'
\ }
let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_by_filename = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_open_new_file = 'et'

map <leader>c :ClearCtrlPCache<cr>:CtrlP<enter>
" range {{{
map <leader>f :Ranger<CR>
let g:NERDTreeHijackNetrw = 0 "// add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "// open ranger when vim open a directory
" }}}
" ale always {{{
let g:ale_sign_column_always=1
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 1
" }}}
" Tern shortkey {{{
nnoremap  <LocalLeader>tD   :TernDoc<cr>
nnoremap  <LocalLeader>tb   :TernDocBrowse<cr>
nnoremap  <LocalLeader>tt   :TernType<cr>
nnoremap  <LocalLeader>td   :TernDef<cr>
nnoremap  <LocalLeader>tp   :TernDefPreview<cr>
nnoremap  <LocalLeader>tsd  :TernDefSplit<cr>
nnoremap  <LocalLeader>ttd  :TernDefTab<cr>
nnoremap  <LocalLeader>tr   :TernRefs<cr>
nnoremap  <LocalLeader>tR   :TernRename<cr>
" }}}
" mutiple cursors
" shortkey to html , javascript, css file {{{
nnoremap <localLeader>js :set filetype=javascript<cr>
nnoremap <localLeader>css :set filetype=css<cr>
nnoremap <localLeader>html :set filetype=html<cr>
nnoremap <localLeader>md :set filetype=markdown<cr>
" }}}
