".............................................................................
" Encoding related settings
".............................................................................
set enc=utf-8           " set UTF-8 encoding"
set fenc=utf-8          " set UTF-8 encoding"
set tenc=utf-8          " set UTF-8 encoding"

".............................................................................
" General settings
".............................................................................
set nocompatible            " disable vi compatibility (emulation of old bugs)
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set viminfo='5000,\"5000    " Don't store more than 500 lines fo registers
set history=1000            " keep 1000 lines of command line history
set undolevels=100          " keep undo level of 100 lines
set t_Co=256                " Set 256 colors
set textwidth=119           " Wrap lines at 119 chars
set ruler                   " show cursor position all the time
set hlsearch                " Highlight search
set showmatch               " Highlight matching braces
set nobackup                " Do not take backup
set nowritebackup           " Do not take write backup
set noswapfile              " Do not create swp file
set clipboard=unnamed       " Use the OS clipboard by default
set number                  " Show line number by default
set background=dark         " Set vim background as dark
set nowrap                  " Disable line wrapping
set foldmethod=indent       " Setting foldmethod to indent
set foldlevel=99            " Setting foldlevel to 99
set expandtab               " Setting expand tab to default
set tabstop=4               " Setting tab space to 4
syntax on                   " Turn on syntax highlighting
filetype off
set splitbelow
set splitright

".............................................................................
" General settings for C, CPP, Java and Python
".............................................................................
autocmd Filetype make setlocal tabstop=8 shiftwidth=4 expandtab number
autocmd Filetype c setlocal tabstop=8 shiftwidth=4 smarttab expandtab number
autocmd Filetype cpp setlocal tabstop=8 shiftwidth=4 smarttab expandtab number
autocmd Filetype java setlocal tabstop=8 shiftwidth=4 smarttab expandtab number
autocmd Filetype sh setlocal tabstop=8 shiftwidth=4 softtabstop=4 smarttab expandtab number
autocmd Filetype yaml setlocal tabstop=8 shiftwidth=4 softtabstop=2 smarttab expandtab number
autocmd Filetype html setlocal tabstop=8 shiftwidth=4 softtabstop=2 smarttab expandtab number
autocmd Filetype python setlocal tabstop=8 shiftwidth=4 softtabstop=2 smarttab expandtab number

".............................................................................
" Settings to remember last visited line
".............................................................................
if has("autocmd")
	au BufReadPost *
	\ if line("'\"") > 1 &&
	\ line("'\"") <= line("$") |
	\ exe "normal! g'\"" | endif
endif

".............................................................................
" Settings to copy line to clipboard
".............................................................................
map <leader>c "*y<CR>"

".............................................................................
" Vundle Setup
".............................................................................
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
call vundle#end()

filetype plugin indent on

".............................................................................
" Split navigations
".............................................................................
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space> za

" The NERDTree is a file system explorer for the Vim editor. Using this plugin,
" users can visually browse complex directory hierarchies, quickly open files
" for reading or editing, and perform basic file system operations.
Plugin 'scrooloose/nerdtree'


" This plugin aims at making NERDTree feel like a true panel, independent of tabs.
Plugin 'jistr/vim-nerdtree-tabs'

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8


Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclartion<CR>

" Python with virtual env support
python3 << EOF
import os
import sys
if "VIRTUAL_ENV" in os.environ:
        project_base_dir = os.environ["VIRTUAL_ENV"]
        activator = os.path.join(project_base_dir, 'bin/activate_this.py')
        with open(activator) as f:
            exec(f.read(), {'__file__': activator})
EOF

" Syntax Checking
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'glepnir/oceanic-material'

set background=dark
colorscheme oceanic_material

" Toggling between dark and light theme
call togglebg#map("<F5>")

let NERDTreeIgnore=["\.pyc$","\~$"]

" Super searching in vim
Plugin 'kien/ctrlp.vim'

" CSV Plugin
Plugin 'chrisbra/csv.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline to make status bar better
Plugin 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim'}

" Lean & mean status/tabline for Vim that's light as air.
Plugin 'vim-airline/vim-airline'

" Various themes over vim airline plugin.
Plugin 'vim-airline/vim-airline-themes'

" A vim plugin which shows a git diff. It shows which lines have been added,
" modified or removed. One can preview, stage, undo individual hunks and
" stage partial hunks.
Plugin 'airblade/vim-gitgutter'

" A vim plugin highlight the part of a line that doesn't fit into textwidth
" or really, whatever width you like.
Plugin 'whatyouhide/vim-lengthmatters'

" A vim plugin used for displaying thin vertical lines at each indentation
" level for code indented with spaces.
Plugin 'Yggdroot/indentLine'

" A vim plugin for various color schemes.
Plugin 'flazz/vim-colorschemes'

" NERDTree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <esc><esc> :noh<return>

if has('autocmd')
        augroup templates
                autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
        augroup END
endif

".............................................................................
" Setting for Vim lengthmatter plugin
".............................................................................
let g:length_matters_on_by_default=0
if match(&runtimepath, 'vim-lengthmatters') != -1
        call lengthmatters#highlight('ctermbg=203 ctermfg=232')
        map <silent><C-e> :LengthmattersToggle<CR>
        imap <silent><C-e> <ESC>:LengthmattersToggle<CR>i
endif

".............................................................................
" Fuzzy finder
".............................................................................
set rtp+=~/.fzf

".............................................................................
" Vim Autocomplete Parantheses
".............................................................................
Plugin 'jiangmiao/auto-pairs'

