call plug#begin()

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', {'as':'dracula'}
"Plug 'vim-python/python-syntax'



call plug#end()
set nocompatible

set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_italic_functions = 1
color dracula

let g:python_highlight_all = 1


set hidden
set number
set mouse=a
set inccommand=split
set relativenumber
set encoding=UTF-8
set autoindent
set smartindent
set cindent
syntax on


" ale

"let g:ale_disable_lsp = 1


let g:ale_linters = {'python': ['flake8', 'pydocstyle', 'bandit', 'mypy', 'pylint']}
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'python': ['black', 'autopep8', 'yapf', 'autoflake', 'isort']}
let g:ale_fix_on_save = 1


let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'


let g:coc_global_extensions = [
    \  'coc-snippets',
    \  'coc-emmet',
    \  'coc-html',
    \  'coc-css',
    \  'coc-json',
    \  'coc-prettier',
    \  'coc-pyright',
    \   ]



inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Create a function to open a neovim terminal in a small split window and run python
"function! Termpy()
"  exec winheight(0)/4."split" | !konsole python3 %
"endfunction

"nnoremap <F5> :call Termpy() <CR>




function! Executar(arq)
  :w
  if &filetype == 'javascript.jsx'
    :exec '!time node' a:arq
  elseif &filetype == 'javascript'
    :exec '!time node' a:arq
  elseif &filetype == 'java'
    :exec "!javac %"
    :exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'python'
    :exec "python3 %"
  elseif &filetype == 'ruby'
    :exec "!time ruby" a:arq
  elseif &filetype == 'html'
    :exec "!live-server %:p:h"
  elseif &filetype == 'racket'
    :exec "!racket" a:arq
  elseif &filetype == 'c'
    :exec "!time clang % && ./a.out %% rm -rf ./a.out"
  elseif &filetype == 'cpp'
    :exec "!time g++ % && ./a.out %% rm -rf ./a.out"
  elseif &filetype == 'sh'
    :exec '!time bash' a:arq
  elseif &filetype == 'php'
    :exec '!time php' a:arq
  elseif &filetype == 'lua'
    :exec '!time lua' a:arq
  elseif &filetype == 'go'
   :exec '!go run' a:arq
  endif
endfunction
"inoremap <F5> :call Executar(shellescape(@%, 1))<CR>
"nnoremap <leader><F5> :call Executar(shellescape(@%, 1))<CR>




" ##### Maps #####
let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>:wq
