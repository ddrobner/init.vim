set nocompatible           " Vim defaults rather than vi ones. Keep at top.
filetype plugin indent on  " Enable filetype-specific settings.
syntax on                  " Enable syntax highlighting.
set backspace=2            " Make the backspace behave as most applications.
set autoindent             " Use current indent for new lines.
set display=lastline       " Show as much of the line as will fit.
set wildmenu               " Better tab completion in the commandline.
set wildmode=list:longest  " List all matches and complete to the longest match.
set showcmd                " Show (partial) command in bottom-right.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces.
set number                 " Show line numbers.
set wrap                   " Wrap long lines.
set laststatus=2           " Always show the statusline.
set ruler                  " Show the ruler in the statusline.
set textwidth=80           " Wrap at n characters.
set nrformats-=octal       " Remove octal support from 'nrformats'.
set tabstop=4              " Size of a Tab character.
set shiftwidth=0           " Use same value as 'tabstop'.
set softtabstop=-1         " Use same value as 'shiftwidth'.

" Persist undo history between Vim sessions.
if has('persistent_undo')
	set undodir=$HOME/.vim/tmp/undo
 	if !isdirectory(&undodir) | call mkdir(&undodir, 'p', 0700) | endif
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale', { 'for': 'python' }
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp', {'for': 'python'}
Plug 'ncm2/ncm2-jedi', { 'for': 'python' }
Plug 'ncm2/ncm2-pyclang', { 'for': 'python'}
Plug 'ObserverOfTime/ncm2-jc2'
Plug 'ncm2/ncm2-path'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/ClosePairs'
Plug 'shime/vim-livedown'
Plug 'gabrielelana/vim-markdown'
call plug#end()

" air-line
 let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
     endif

     " unicode symbols
     let g:airline_left_sep = '»'
     let g:airline_left_sep = '▶'
     let g:airline_right_sep = '«'
     let g:airline_right_sep = '◀'
     let g:airline_symbols.linenr = '␊'
     let g:airline_symbols.linenr = '␤'
     let g:airline_symbols.linenr = '¶'
     let g:airline_symbols.branch = '⎇'
     let g:airline_symbols.paste = 'ρ'
     let g:airline_symbols.paste = 'Þ'
     let g:airline_symbols.paste = '∥'
     let g:airline_symbols.whitespace = 'Ξ'

     " airline symbols
     let g:airline_left_sep = ''
     let g:airline_left_alt_sep = ''
     let g:airline_right_sep = ''
     let g:airline_right_alt_sep = ''
     let g:airline_symbols.branch = ''
     let g:airline_symbols.readonly = ''
     let g:airline_symbols.linenr = ''

color monokai
let g:airline_theme='minimalist'
map <C-n> :NERDTreeTabsToggle<CR>
map <C-l> :LivedownPreview<CR>
map <C-k> :LivedownKill<CR>

if has("unix")
	let g:python_host_prog='/usr/bin/python2.7'
	let g:python3_host_prog='/usr/bin/python'
elseif has("win32")
	let g:python_host_prog='C:\Python27\python.exe'
	let g:python3_host_prog='C:\Users\David\AppData\Local\Programs\Python\Python37/python.exe'
endif

set fileformat=unix
set fileformats=unix,dos
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufEnter *.md setlocal spell spelllang=en_us
set completeopt=noinsert,menuone,noselect
autocmd FileType markdown call ncm2#disable_for_buffer()
let g:markdown_enable_spell_checking = 0
