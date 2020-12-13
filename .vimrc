set nocompatible
set nolist
set rnu

"inoremap " ""<left>
""inoremap ' ''<left>
""""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>0

set tabstop=4

" desabling swap files
set noswapfile
"set mouse=a active wrap
set wrap

set hlsearch
set incsearch
set cpoptions+=x

set noerrorbells
set visualbell

" show mode and command
set showmode
set showcmd

" t matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show line numbers
set number

" map buffers FZF
noremap <C-b> :buffers<CR>
" switching between buffers
noremap <C-Up> :bnext<CR>
noremap <C-Down> :bprev<CR>

" Enable mouse scrolling
set mouse=a
map <ScrollWheelUp> <K>
map <ScrollWheelDown> <J>

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
set ttyfast

let mapleader = ','

" Map NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>
" map Ctrl q to save
nnoremap <leader>ss :w<CR>
" Exit map
nnoremap <leader>qq :q!<CR>

" moving beetwen tabs:
 ""noremap <C-Left> :tabprevious<CR>
 ""noremap <C-Right> :tabnext<CR>
nnoremap <leader>tk :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" remap Ctrl F to :Files command
noremap <silent> <C-f> :Files<CR>

filetype indent on
filetype plugin indent on

" List of plugins to install
call plug#begin()

	Plug 'junegunn/fzf.vim'
	Plug 'dikiaap/minimalist'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'davidhalter/jedi-vim'
	Plug 'majutsushi/tagbar'
	Plug 'joshdick/onedark.vim'
	Plug 'preservim/nerdtree'
	Plug 'dense-analysis/ale'
	Plug 'pangloss/vim-javascript'
	Plug 'leafgarland/typescript-vim'

call plug#end()

set omnifunc=htmlcomplete#CompleteTags


" config tagbar
nmap <F8> :TagbarToggle<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Give more space for displaying messages.
set cmdheight=4

" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <C-TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
   inoremap <silent><expr> <c-space> coc#refresh()
else
     inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'

set t_Co=256
syntax on
colorscheme onedark

" One Dark theme configure
let g:onedark_terminal_italics=1 

" use 24 bit true color in VIM
if(empty($TMUX))
	if(has("nvin"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif

	if(has("termguicolors"))
		set termguicolors
	endif
endif
