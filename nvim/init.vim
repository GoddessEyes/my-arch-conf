" ====== Default Params ====== "

" включить подсветку синтаксиса
syntax on
" показывать номера строк
set number

" установить tab равным 4 пробелам
set ts=4

" отступ при переходе на следующую строку при написании кода
set autoindent

" преобразование tab-ов в пробелы
set expandtab

" при использовании команд >> или << сдвигать строки на 4 пробела
set shiftwidth=4

" выделять строку, на которой находится курсор
set cursorline

" показывать парную скобку для [] {} и ()
set showmatch

" включить подсветку синтаксиса Python
let python_highlight_all = 1

" ============================== "

" ====== VIM-PLUG ====== "
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'hardcoreplayers/oceanic-material'
Plug 'ycm-core/YouCompleteMe'

call plug#end()
" ====================== "

" ====== Keybindings ======= "

map <C-n> :NERDTreeToggle<CR>

" ========================== "

" ====== Themes ====== "

set background=dark
colorscheme oceanic_material

" ==================== "


" ====== Custom Function ====== "

" Window control:
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

