" Neovim Configuration

" Basic settings
set nocompatible                    " Use improved mode
set encoding=utf-8
filetype plugin indent on            " Enable filetype-specific plugins and indenting
syntax enable                        " Enable syntax highlighting
set clipboard=unnamed                " Use system clipboard
set ignorecase                       " Case insensitive search
set mouse=a                          " Enable mouse support
set number                           " Show line numbers
set incsearch                        " Incremental search
set hlsearch                         " Highlight search results
set showmatch                        " Show matching brackets
set expandtab                        " Use spaces instead of tabs
set tabstop=4 shiftwidth=4 softtabstop=4  " Tab settings
set laststatus=2                     " Always show status line
set cursorline                       " Highlight the current line
set backup                           " Enable backups
set background=light                 " Set light background
set ruler                            " Show the cursor position
set showcmd                          " Show command in status line
set backupdir=~/.vim-tmp,/tmp         " Backup directory
set directory=~/.vim-tmp,/tmp         " Swap file directory

" Key mappings
nnoremap <C-y> "+y                   " Copy to system clipboard in normal mode
vnoremap <C-y> "+y                   " Copy to system clipboard in visual mode
nnoremap <C-p> "+gP                  " Paste from system clipboard in normal mode
vnoremap <C-p> "+gP                  " Paste from system clipboard in visual mode

" Tab navigation
nnoremap <S-l> :tabn<CR>             " Switch to next tab
nnoremap <S-h> :tabp<CR>             " Switch to previous tab

" Easy split navigation
nnoremap <C-h> <C-w>h                " Move to left split
nnoremap <C-j> <C-w>j                " Move to split below
nnoremap <C-k> <C-w>k                " Move to split above
nnoremap <C-l> <C-w>l                " Move to right split

" Vundle plugin manager setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins list
Plugin 'gmarik/vundle'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'liuchengxu/space-vim-dark'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-rails'
Plugin 'elixir-editors/vim-elixir'
Plugin 'whiteinge/diffconflicts'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'tomlion/vim-solidity'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'mileszs/ack.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'posva/vim-vue'
Plugin 'tomasr/molokai'

call vundle#end()                    " End plugin section

" Colorscheme
colorscheme molokai

" Leader key setup
let mapleader=','
let maplocalleader=' '

" RSpec shortcuts
map <Leader>s :call RunNearestSpec()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" Fzf configuration
nnoremap <C-p> :FZF<CR>
nnoremap <Leader> :Ag<CR>
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-t': 'tabnew'
            \ }
let g:FZF_DEFAULT_COMMAND = 'ag --ignore={build,*.log,.git,.project,*.o,*.d,hw_1_5/*} %s -l --hidden -g ""'

" Hex view/write mappings
nmap <Leader>br :%!xxd<CR> :set filetype=xxd<CR>
nmap <Leader>bw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

" RSpec shortcuts
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!rspec {spec}"

" Git Gutter configuration
let g:gitgutter_eager = 0
let g:gitgutter_highlight_lines = 0

" FileType specific tab configuration
autocmd FileType ruby,haml,html,eruby,yaml,javascript,sass,cucumber set sw=2 sts=2
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php,sh,vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Go bindings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Autocomplete setup
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree mappings
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>m :NERDTreeToggle<CR>

" Folding mappings
nnoremap <F1> za
vnoremap <F1> zf
