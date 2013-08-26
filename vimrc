set nocompatible " improved
set encoding=utf-8
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype on
filetype plugin on
filetype indent on


NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------
"---------------Vundle old files---------------
" ---------------------------------------------
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"256 color bash
"Bundle 'gmarik/vundle'

syntax on
syntax enable

set background=light
"let g:solarized_termcolors=256
set t_Co=256

set cursorline

"fix erase background color problem!!!
"if &term =~ '256color'
"    set t_ut=
    "endif
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mattn/zencoding-vim'
"NeoBundle 'mattn/gist-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle "tomtom/tlib_vim"
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neocomplete'
"NeoBundle 'garbas/vim-snipmate'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'godlygeek/tabular'
"NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'jimsei/winresizer'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'scrooloose/nerdcommenter'


" move between splits tmux = vim
"NeoBundle 'majutsushi/tagbar'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'SirVer/ultisnips'
"


"snippets
let g:neosnippet#snippets_directory='~/.snippets'


"colorschemes
NeoBundle 'joedicastro/vim-molokai256'
NeoBundle 'sjl/badwolf'
NeoBundle 'tomasr/molokai'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'zaiste/Atom'
colorscheme badwolf
"let g:molokai_original = 1
"let g:rehash256 = 1

let g:badwolf_darkgutter = 1

"let g:solarized_termcolors=256
"let g:solarized_termtrans=0
"let g:solarized_degrade=0
"let g:solarized_bold=1    
"let g:solarized_underline=1
"let g:solarized_italic=1    
"let g:solarized_contrast='high'
"let g:solarized_visibility='high'

"-------------tagbar-----------------
"nmap <F5> :TagbarToggle<CR>

"-------Zen coding--------
"let g:user_zen_leader_key = '<C-SPACE>'

"tagbar
let g:tagbar_ctags_bin = 1
"tabular
let g:tabular_loaded = 1

"folding
"nnoremap <F1> za
"vnoremap <F1> zf

"set background=dark


"Ident guidelines
let g:indentLine_char= '┆'
let g:indentLine_enabled = 1
let g:indentLine_filetype = []
let g:indentLine_color_term = 239

"---------------------------------------------------
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

"highlight Normal guibg=black guifg=white
"
" Colors
" Bron #BC9458
"
"hi IndentGuidesOdd ctermbg=#FFC66D
"hi IndentGuidesEven ctermbg=#BC9458



autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby


"git g:gitgutter fix tabs performance
let g:gitgutter_eager = 0


let g:snipMate = {}

let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'


"airblade/vit-gitgutter by default
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_lines = 0

set nocompatible

"let g:clipbrdDefaultReg = '+'

"gist xclip command
let g:gist_clip_command = 'xclip -selection clipboard'



"========================= Start of runners =========================
"ruby run without warnings                  
"autocmd FileType ruby map <F5> :w<CR>:!clear && ruby %<CR>
" Custom syntax checked
autocmd FileType ruby map <F9> :w<CR>:!clear && ruby -c %<CR>
" Ruby run
autocmd FileType ruby map <F8> :w<CR>:!clear && ruby -w  %<CR>

" Perl run
autocmd FileType perl map <F8> :w<CR>:!clear && perl %<CR>

" firefox 
autocmd FileType html map <F8> :w<CR>:!clear && chromium %<CR>

"javascript run juejuejue
autocmd FileType javascript map <F8> :w<CR>:!clear && node %<CR>
"==========================+END of runners===========================




"Custom EASY split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l



""""""""""""""""""""""
"      BASIC SETS    "
""""""""""""""""""""""
set clipboard=unnamedplus
set ignorecase                  " set case insensitivity
set mouse=a                     " try to use a mouse in the console (wimp!)
set number
" :Searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
"et diffopt=filler,iwhite     " ignore all whitespace and sync

"backup to ~./.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'







"Ruby
autocmd FileType ruby,haml,html,eruby,yaml,javascript,sass,cucumber set ai sw=2 sts=2 et



" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

"CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"javaScript
autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
let javascript_enable_domhtmlcss=1

"PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

"Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4



"newww
set ruler
set showcmd


"FUCKING ARROW l
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>




"------------------------------
"----------Neocomplete---------
"------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }


" Enable heavy omni completion
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'



if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



"----------------------------------------------------------------------------------"
"-------------------------Neosnippets----------------------------------------------" 
"----------------------------------------------------------------------------------"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#enable_snipmate_compatibility = 1


" Elegant tab switcher

map <S-k> :tabn<CR>
map <S-j> :tabp<CR>
map <S-l> :tabn<CR>
map <S-h> :tabp<CR>

"map <S-n> :tabnew<CR>

"--------------------------------------------------
"------------- YCM AND ULTISNIPS-------------------
"--------------------------------------------------
"let g:ycm_key_list_previous_completion=['<Up>']/
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"


"Unite search ag grep
nnoremap <space>/ :Unite grep:.<cr>

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

"UNITE history
"let g:unite_source_history_yank_enable = 1
"nnoremap <space>y :Unite history/yank<cr>


"less syntax highlight

au BufRead,BufNewFile *.less setfiletype css

"map <Leader>a :Tab / = /l0<CR>:Tab / :/l0<CR>

NeoBundleCheck
