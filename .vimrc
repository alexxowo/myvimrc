syntax on
set rnu " Relative Number Line "
set nolist " I dont have idea for this :v"
set noerrorbells
set nocompatible 
set wrap " Set wrap "
set tabstop=4 " Tab size"
set shiftwidth=4 " Shiftwidth"
set smarttab
set mouse=a " Active Mouse"
set noswapfile " Dont Create swap file"
set nobackup
set incsearch
set cpoptions+=x
set number " Show Number line"
set showmode " Show mode"
set showcmd " Show command"
set cmdheight=4 " Command windows height size"
set matchpairs+=<:>
set ttyfast
set termguicolors
set t_Co=256

filetype plugin indent on
let mapleader = ','
" Go To code na
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>k :wincmd h<CR>
nmap <leader>l :wincmd j<CR>

"Use tab for trigger completion with characters ahead and navigate.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Save
nnoremap <leader>ss :w!<CR> 
" Exit
nnoremap <leader>qq :q!<CR>
" Save and Exit
nnoremap <leader>sq :wq!<CR>
" Tabs Config - Close tab
noremap <leader>tc :tabclose<CR>
" move between buffers
noremap <C-Right> :bnext!<CR>
noremap <C-Left> :bprev!<CR>
" Close Actual buff and save if not saved
command! CloseBuff :call s:closeBuffer()
noremap <C-q> :CloseBuff<CR>
" Remap CTRL F to Files
noremap <silent> <C-f> :Files<CR>

call plug#begin('~/.config/nvim/plugged')
	" Airline plug	
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Themes
	Plug 'joshdick/onedark.vim'
	Plug 'dracula/vim'
	Plug 'morhetz/gruvbox'
	" FZF
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'	
	" NERDTree
	Plug 'scrooloose/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" Productive plugins
	Plug 'Yggdroot/indentLine'
	Plug 'jiangmiao/auto-pairs'	
	" Jedi VIM
	Plug 'davidhalter/jedi-vim'
	" Conquer of Completion (COC)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
		
	" JavaScript and TypeScript support
	Plug 'pangloss/vim-javascript'
	Plug 'leafgarland/typescript-vim'	
call plug#end()

colorscheme dracula

" jevi vim config
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#auto_initialization = 0

" COC Plugins
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-phpls', 'coc-pyright']

" Vim Airline status config
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'

" Don't show indent line
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" Open NERDTree with CTRL N
map <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "Staged"    : "#0ee375",  
    "Modified"  : "#d9bf91",  
    "Renamed"   : "#51C9FC",  
    "Untracked" : "#FCE77C",  
    "Unmerged"  : "#FC51E6",  
    "Dirty"     : "#FFBD61",  
    "Clean"     : "#87939A",   
    "Ignored"   : "#808080"   
"}   

" NERDTree Highlight
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Functions
" Function for COC,move with tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Close Buffer and save if not saved
function! s:closeBuffer()	
	let state = &mod
	if (state == 1)
		echo 'File is modified... Saving.'
		w!	
		bd!
	else
		echo 'Closing current buffer'	
		bd!
	endif
endfunction
