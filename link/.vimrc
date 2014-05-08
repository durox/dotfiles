" Utility======================================================================
set encoding=utf-8
autocmd! bufwritepost .vimrc source %
call pathogen#infect()
call pathogen#helptags()

filetype off
filetype plugin indent on
au BufNewFile,BufRead *.py set filetype=python
syntax on

" reload file when changes happen in other editors
set autoread

" ignores files when extending wildcards
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" enable mouse support in all modes
set mouse=a

" make backspace behave like normal again
set backspace=2

" shell like tabcompletion in command
set wildmenu
set wildmode=longest:full

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" make yank copy to the global system clipboard
set clipboard=unnamed

" Improving code completion
set completeopt=longest,menuone


" found here: http://stackoverflow.com/a/2170800/70778
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Compatible with ranger 1.4.2 through 1.6.*
"
" Add ranger as a file chooser in vim
"
" If you add this function and the key binding to the .vimrc, ranger can be
" started using the keybinding ",r".  Once you select a file by pressing
" enter, ranger will quit again and vim will open the selected file.

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map ,r :call RangerChooser()<CR>


"" Folding
"set foldmethod=indent
"nnoremap <space> za
"vnoremap <space> zf

" set history length
set history=700
set undolevels=700

" search options
"set hlsearch
"set incsearch
"set ignorecase
"set smartcase

"" Awesome line number magic
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>l :call NumberToggle()<cr>
:au FocusLost * set number
:au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
set relativenumber

set number

" Show trailing whitespace
" =========================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader>x :%s/\s\+$//


" Color scheme
" =============

set t_Co=256

if has("gui_running")
    color solarized
    set background=dark
    set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 11
else
    color wombat256mod
endif

set colorcolumn=80
highlight ColorColumn ctermbg=233
"highlight ColorColumn ctermbg=20
map <Leader>v :source ~/.vimrc


" =====Plugins=================================================================

" Settings for airline
set laststatus=2
let g:airline_powerline_fonts = 1
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


" =====Keybindings=============================================================

let mapleader = "," " rebind <Leader> key

call togglebg#map("<F10>")

noremap <C-o> :only<CR>

" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>

" Bind nohl
noremap <Leader>h :nohl<CR>

" todo list
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>


" center the cursor vertically
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"map <Leader>m <esc>:tabprevious<CR>
"map <Leader>. <esc>:tabnext<CR>
map <F11> <esc>:tabprevious<CR>
map <F12> <esc>:tabnext<CR>
vnoremap <Leader>s :sort<CR>

map <C-t> :tabnew<CR>


" Custom mappings
" ================
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG  " select all


" Fixing the copy & paste madness
" ================================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a


" Python IDE===================================================================

" TODO: make options dependend on *.py filetype

" set pythonic tab behavior
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" set fixed line length
set nowrap " don't automatically wrap on load
set tw=79  " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing

"nmap <F5> :!/usr/bin/env python %<CR>
nmap <F5> :!/home/durox/.anaconda/bin/python %<CR>


" FORTRAN90====================================================================

nmap F :!gfortran % -o vim.out && ./vim.out && rm vim.out<CR>

" Plugins======================================================================

" Settings for jedi-vim
"let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
"let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for ctrlp
let g:ctrlp_max_height = 30


" Settings for UtilSnips
let g:UltiSnipsEditSplit = 'vertical'
"let g:UltiSnipsJumpForwardTrigger="<c-n>"

" Settings for Session
let g:session_autosave = 'no'

" Settings for Vimwiki
let g:vimwiki_list = [{'path': '~/Wiki/', 'path_html': '~/Wiki/html/'}, {'path': '~/repos/geotec/doc/', 'path_html': '~/repos/geotec/doc/html/'}]