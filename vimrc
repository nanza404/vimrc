" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

syntax on

set shortmess+=I
set relativenumber
set ignorecase
set laststatus=2
set noerrorbells visualbell t_vb=
set smartindent
set tabstop=4 softtabstop=0
set encoding=utf-8
set shiftwidth=4
set nu
set smartcase
set hlsearch
set incsearch
set colorcolumn=80
highlight colorcolumn ctermbg=0 guibg=lightgrey

if (has("termguicolors"))
	set termguicolors
endif

" Source a global configuration file if available"
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dominikduda/vim_current_word'
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'vim-utils/vim-man'
Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'puremourning/vimspector'
Plug 'mattn/emmet-vim'

call plug#end()

let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

let g:user_emmet_install_global = 0
autocmd Filetype html,css EmmetInstall
let g:netrw_browser_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 4
"hi IndentGuidesOdd ctermbg=darkgrey
"hi IndentGuidesEven ctermbg=darkgrey

" ctrl-n toggles nerdtree file explorer " 
nnoremap <C-n> :NERDTreeToggle<CR>
" :ff opens :FZF(fuzzy finder in vim) "
cnoreabbrev <expr> ff getcmdtype() == ":" && getcmdline() == 'ff' ? 'FZF' : 'FZF'

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
" F1 toggles highlight search "
set hlsearch!
nnoremap <F1> :set hlsearch!<CR>

