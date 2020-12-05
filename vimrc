scriptencoding utf-8    " The encoding for vim scripts
set encoding=utf-8      " The encoding displayed
set fileencodings=utf-8 " The encoding written to file

filetype plugin indent on

" Set colorscheme
syntax on
colorscheme iceberg

" Set tab to 4 spaces
set tabstop=4      " The width of a tab is set to 4
set softtabstop=0  " Will insert spaces to simulate tab stops
set expandtab      " Expand tabs to spaces
set shiftwidth=4   " The size of an indent
set smarttab       " Make the tab key insert spaces to go to the next indent
 
set ai             " Auto indentation            (:set noai)
set nu             " Show line number            (:set nonu)         
set ru               
set ic             " Ignore case                 (:set noic)
set hlsearch       " Highlighting search matches (:set noh)
set incsearch      " Incremental search
set confirm        " 
set history=100 
set backspace=2    " Allow backspacing over everything in insert mode
set cursorline
set nofixendofline " Disable automatic newline at end of file
set tw=0           " Disable long line auto broken
"set nowrap        " Disable auto-wrapping
set colorcolumn=80

set showbreak=↪\
set list listchars=trail:.
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,space:·

" Set status line
set laststatus=2     
set statusline=%1*%<\ %2*[%F]
set statusline+=%1*\ %3*[%{&encoding},%{&fileformat}
set statusline+=%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]
set statusline+=%m%1*%=\ %4*%y%1*\ %5*%l/%L%1*,%5*%c%1*\ %6*\<%P\>%4*
highlight User1 term=underline cterm=underline ctermfg=white
highlight User2 ctermfg=red
highlight User3 ctermfg=cyan
highlight User4 ctermfg=white
highlight User5 term=underline cterm=underline ctermfg=yellow
highlight User6 term=underline cterm=underline ctermfg=green

" Jump back to previous cursor position
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" code foding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Control the position of the new window
set splitbelow
set splitright

" keymap
cnoremap sudow w !sudo tee % >/dev/null
inoremap jk <ESC>:w<cr>
map zz :qa<cr>
map <F7> :tabp<cr>        " Previous tab
map <F8> :tabn<cr>        " Next tab
nnoremap <C-J> <C-W><C-J> " Jump to bottom split
nnoremap <C-K> <C-W><C-K> " Jump to top split
nnoremap <C-L> <C-W><C-L> " Jump to right split
nnoremap <C-H> <C-W><C-H> " Jump to left split

" Plugins

" F7: Previous tab
" F8: Next tab
" F9: Toggle NERD Tree

" NERD Tree
let g:NERDTreeWinSize = 25
nmap <F9> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_width = 25
nmap <F10> :TagbarToggle<cr>

" Taglist
"let Tlist_Use_Right_Window = 1
"let Tlist_Show_One_File = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Close_On_Select = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_WinWidth=25
"map <F12> :TlistToggle<cr>
"autocmd VimEnter * TlistToggle

set tags=tags; " When Vim tries to locate the 'tags' file, it first looks at the current directory, then the parent, and so on

" Open NERDTree and Tagbar automatically
autocmd VimEnter * NERDTree
"autocmd VimEnter * TagbarToggle
call feedkeys("\<C-H>")

" airline
let g:airline_section_z = '%l/%L, %c'
let g:airline#extensions#whitespace#enabled = 0