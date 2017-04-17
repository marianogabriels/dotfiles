"Configuracion Basica
set nocompatible " improved
set encoding=utf-8


filetype on
filetype plugin on
filetype indent on
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
syntax on
syntax enable

set rtp+=~/.vim/bundle/Vundle.vim


"Configuracion basica
set clipboard=unnamedplus
set ignorecase                  " set case insensitivity
set mouse=a                     " try to use a mouse in the console (wimp!)
set number
set incsearch                 " incremental search
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
set showmatch
set cursorline
set incsearch
set hlsearch
set backup
set background=light
set ruler
set showcmd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set foldmethod=indent


" Elegant tab switcher
map <S-k> :tabn<CR>
map <S-j> :tabp<CR>
map <S-l> :tabn<CR>
map <S-h> :tabp<CR>


call vundle#begin()
Plugin 'gmarik/vundle'
"Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-markdown'
Plugin 'Shougo/vimproc.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-rails'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

"Themes colorschemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
"Plugin 'joedicastro/vim-molokai256'
"Plugin 'jpo/vim-railscasts-theme'
"Plugin 'zaiste/Atom'
call vundle#end()


colorscheme badwolf

" LEADER
let mapleader=','
let maplocalleader= ' '

" Hex read
nmap <Leader>br :%!xxd<CR> :set filetype=xxd<CR>
"
" " Hex write
nmap <Leader>bw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>


"tabular
let g:tabular_loaded = 1

"folding
nnoremap <F1> za
vnoremap <F1> zf

"Ident guidelines
"let g:indentLine_char= '┆'
"let g:indentLine_enabled = 1
"let g:indentLine_filetype = []

"Git gutter
let g:gitgutter_eager = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_lines = 0

"========================= Start of runners =========================
autocmd FileType ruby map <F9> :w<CR>:!clear && ruby -c %<CR>
autocmd FileType ruby map <F8> :w<CR>:!clear && ruby -w  %<CR>
autocmd FileType ruby map <F7> :SyntasticCheck rubocop <CR>
autocmd FileType perl map <F8> :w<CR>:!clear && perl %<CR>
autocmd FileType html map <F8> :w<CR>:!clear && chromium %<CR>
autocmd FileType javascript map <F8> :w<CR>:!clear && node %<CR>
"==========================+END of runners===========================

"Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


"Filetype tab configuration
autocmd FileType ruby,haml,html,eruby,yaml,javascript,sass,cucumber set sw=2 sts=2
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
let javascript_enable_domhtmlcss=1
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4


"Chau Arrows
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>


"Autocomplete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType perl setlocal complete-=i
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.less setfiletype css
au BufRead,BufNewFile *.scala setfiletype scala
au BufRead,BufNewFile *.go set filetype=go

" go bindings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Syntastic checkers
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_html_checkers=[]
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list=1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" Repl-tmux
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name":"default", "target_pane":"1"}
let g:slime_paste_file = "$HOME/.smile_paste"
