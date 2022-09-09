call plug#begin('~/.vim/plugged')
Plug 'neoclide/vim-jsx-improve'
" Plug 'Shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'shougo/vimfiler.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'jiangmiao/auto-pairs'
Plug 'herringtondarkholme/yats.vim'
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Any valid git URL is allowed
" Multiple Plug commands can be written in a single line using | separators
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'tpope/vim-fugitive'
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

set number
set relativenumber
set autoindent
set tabstop=2
set background=dark
set expandtab
set shiftwidth=2
filetype plugin indent on


" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" fix cursor display in cygwin
if has("win32unix")
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif



let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" open and close indicator in nerd tree
let g:NERDTreeDirArrowExpandable = '+'

let mapleader = ","
" Key bindings
" Resize split pane
map <c-o> :vertical resize +10<CR>
map <c-f> :vertical resize -10<CR>

" Navigate through the tabs
"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" FZF and Files, and RipGrep
nnoremap <silent> <C-p> :GitFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" settings
let g:dracula_italic = 0
colorscheme codedark
let g:airline_theme='codedark'
let g:vimfiler_as_default_explorer = 1

nmap <C-n> :VimFiler<cr>
let g:indent_guides_enable_on_vim_startup = 1
" tmuxline seperator
let g:tmuxline_powerline_separators = 0 
