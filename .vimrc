silent! call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'DavidLin2015/taglist.vim'
Plug 'wellle/targets.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rking/ag.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'vim-scripts/gtags.vim'

"Plug 'Valloric/YouCompleteMe'
" Initialize plugin system

call plug#end()

set encoding=utf-8

vmap <silent> \ jmPk:!astyle -A2 -y -j -c -p -xe -k1 -W1 -s4 -xn -xc -xl -xk -S -K -Y -m0 -M40 -C --mode=c<cr>V`Pk==:delmarks P<cr>
syntax on
set nocompatible
" set ai
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set ruler
set backspace=2
set ic
set ru
set hlsearch
set incsearch
set smartindent
set confirm
set history=100
set cursorline
set number

colorscheme torte
"colorscheme desert
set background=dark
set t_Co=256

set tags=tags
set tags+=../tags;
set autochdir

set list listchars=tab:>-,trail:-

hi CursorLine term=bold cterm=bold

let mapleader="\\"
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
imap <C-Left> <Esc>:tabprev<CR>
imap <C-Right> <Esc>:tabnext<CR>
vmap <C-Left> <Esc>:tabprev<CR>
vmap <C-Right> <Esc>:tabnext<CR>

map gr gT
set foldmethod=marker
set foldmarker={,}
set foldlevel=255

vmap c I//<esc>

"map <F1> <Esc>:!makepkg \|&tee make.log<CR>
"map <F2> <Esc>:!makedbg \|&tee make.log<CR>

"map <F1> <Esc>:w<CR>:set makeprg=makepkg   <CR>:make<CR>
"map <F2> <Esc>:w<CR>:set makeprg=makedbg   <CR>:make<CR>
"map <F3> <Esc>:w<CR>:set makeprg=makeprl   <CR>:make<CR>
"map <F4> <Esc>:w<CR>:set makeprg=makeprldbg<CR>:make<CR>

map <F1> <Esc>:w<CR>:AsyncRun source ~/.bashrc; makecdpkg<CR>:call asyncrun#quickfix_toggle(8, 1)<CR>
map <F2> <Esc>:w<CR>:AsyncRun source ~/.bashrc; makecddbg<CR>:call asyncrun#quickfix_toggle(8, 1)<CR>
map <F3> <Esc>:w<CR>:AsyncRun source ~/.bashrc; makecdprl<CR>:call asyncrun#quickfix_toggle(8, 1)<CR>
map <F4> <Esc>:w<CR>:AsyncRun source ~/.bashrc; makecdprldbg<CR>:call asyncrun#quickfix_toggle(8, 1)<CR>

noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
map <F10> <Esc>:AsyncStop<CR>

map <LEADER>[ <Esc>:cp<CR>zz:cc<CR>
map <LEADER>] <Esc>:cn<CR>zz:cc<CR>
map <LEADER>l <Esc>:cl<CR>

map <LEADER>{ <Esc>:lp<CR>zz:ll<CR>
map <LEADER>} <Esc>:lne<CR>zz:ll<CR>
map <LEADER>L <Esc>:lop<CR>

nmap <LEADER>c yiw
nmap <LEADER>d diw
"nmap <LEADER>p "0p
nmap <LEADER>v ciw<C-r>0<ESC>

nmap <LEADER>1 1gt
nmap <LEADER>2 2gt
nmap <LEADER>3 3gt
nmap <LEADER>4 4gt
nmap <LEADER>5 5gt
nmap <LEADER>6 6gt
nmap <LEADER>7 7gt
nmap <LEADER>8 8gt
nmap <LEADER>9 9gt

nmap <LEADER><TAB> <C-w>w

nmap <LEADER><Cr> o<Esc>

nmap <S-LEFT>  <C-w><
nmap <S-RIGHT> <C-w>>
nmap <S-UP>    <C-w>+
nmap <S-DOWN>  <C-w>-

map <LEADER>+  <C-w>\|<C-w>_
map <LEADER>=  <C-w>=

"inoremap <c-u> <c-g>u<c-u>
"inoremap <c-w> <c-g>u<c-w>
"vmap <silent> <c-g> y:set hlsearch<CR>:let @/="<c-r>""<CR>:tabe<CR>:!ag "<c-r>"" <cr>"" *.cc *.h<CR>"
vmap <silent> <c-g> y:set hlsearch<CR>:let @/="\<<c-r>"\>"<CR>:tabe<CR>:grep "<c-r>"" *.cc *.h<CR>"
vmap <silent> <c-h> y:set hlsearch<CR>:let @/="\<<c-r>"\>"<CR>:tabnew<CR>:grep "<c-r>"" ../*/*.cc ../*/*.h<CR>"

map <silent> <LEADER>m :set hlsearch<CR>:let @/="<C-R><C-W>"<CR>:call HighlightNearCursorSwitch(1)<CR>
vmap <silent> <LEADER>m y:set hlsearch<CR>:let @/="<C-R>0"<CR>
noremap   <silent> <F12> :set hlsearch!<CR>:match<CR>
inoremap  <silent> <F12> <Esc>:set hlsearch!<CR>:match<CR>a
vnoremap  <silent> <F12> <Esc>:set hlsearch!<CR>:match<CR>gv
nnoremap ; :
vnoremap ; :
map <SPACE> <leader>
map <LEADER><SPACE> i<SPACE><ESC>l

map <C-UP>   <C-Y>
map <C-DOWN> <C-E>
map <C-K>   <C-Y>
map <C-J> <C-E>
set wildmode=longest,list,full
set wildignorecase


nmap <silent> n nzz:call HighlightNearCursorSwitch(1)<cr>
nmap <silent> N Nzz:call HighlightNearCursorSwitch(0)<cr>

map <F8> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
map <leader>s :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set matchpairs+=<:>
au BufNewFile,BufRead *.tn          set ft=tcl
au BufNewFile,BufRead *.tn_include  set ft=tcl
au BufNewFile,BufRead *.msg set ft=cpp
au BufNewFile,BufRead *.clang-tidy set ft=yaml
map <silent> <F11> :set list!<CR>
function! HighlightNearCursorSwitch(enable)
  if a:enable == 1
    exe 'match Todo /\c\k*\%#\k*\&' . @/ . '/'
  else
    match None
  endif
endfunction

function! HighlightNearCursorToggle()
  if !exists("s:highlightcursor")
    exe 'match Todo /\c\k*\%#\k*\&' . @/ . '/'
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction

function! JumpToJrd()
    norm "pyiw
    exe 'let isreadable=isdirectory("'.@p.'")'
    if isreadable
        exe 'e '.@p
    else
        exe 'let isreadable=filereadable("header_'.@p.'.yaml")'
        if isreadable
            exe 'e header_'.@p.'.yaml'
        endif
    endif
endfunction
map <silent><F5> :call JumpToJrd()<CR>
command! F execute "echo expand('%:p')"

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map <leader>f :call ShowFuncName() <CR>

"p4 commands
"command! P4e execute "!p4 edit   expand('%:p')"
"command! P4r execute "!p4 revert expand('%:p')"
"command! P4o execute "!p4 opened  "
"command! P4d execute "!p4 diff   expand('%:p')"

command! P4e execute "!p4 edit "   . resolve(expand('%:p'))
command! P4r execute "!p4 revert " . resolve(expand('%:p'))
command! P4d execute "!p4 diff "   . resolve(expand('%:p'))

highlight ModeMsg ctermfg=green

" Cscope setting
"set cscopetag

"set csto=1

"set nocscopeverbose

"if filereadable("cscope.out")

"    cs add cscope.out

"elseif $CSCOPE_DB != ""

"    cs add $CSCOPE_DB

"endif

"fun! UpdateCscope()
"    exe "!cscope -Rbq -i cscope.files"
"    cs reset
"endfun
"map <silent><F6> :call UpdateCscope()<CR>

"nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
"
"nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
"
"nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
"
"nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
"
"nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
"
"nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"
"nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"
"nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

set noshowmode
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

map <silent><C-n> :NERDTreeToggle<CR>
"set showbreak=↪
hi CursorLineNR ctermfg=green
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
map <silent><F7> :TlistToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#buffer_idx_mode=1

set complete=.,w,b,u,t
set completeopt=longest,menuone
let g:AutoPairsMultilineClose=0
let g:AutoPairs={'{':'}'}
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_server_use_vim_stdout = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  "let g:ctrlp_use_caching = 0
endif
if &diff
    set cursorline
    map <leader>] ]c
    map <leader>[ [c
endif
command! BufNum echo len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
set smartcase
map <leader>n :bn<CR>
map <leader>p :bp<CR>

set noswapfile

source ~/vim-script/cpp.vim
set diffopt=filler,vertical
command! Bufo execute "%bd|e#"

source ~/vim-script/diffBufPair.vim

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"set path=.,,**
"
" Print cout debug msg
"vmap <leader>o postd::cout << "<ESC>pa = " << <ESC>pa << std::endl;<ESC>==
vmap <leader>o y:let @0 = 'std::cout << "'.@0.' = " << '.@0.' << std::endl;'."\n" <CR>
command! -nargs=1 -complete=file Tabe tab drop <args>
cabbrev tabe <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Tabe' : 'tabe')<CR>

" vimdiff ignore all spaces
"set diffexpr=DiffW()
"function DiffW()
"    "     syntax off
"    "     set undolevels=0
"    let opt = ""
"    if &diffopt =~ "icase"
"        let opt = opt . "-i "
"    endif
"    if &diffopt =~ "iwhite"
"        let opt = opt . "-w " " swapped vim's -b with -w
"    endif
"    silent execute "!diff -a --binary " . opt .
"                \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
"endfunction

"set cscopetag
"set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
map <LEADER>g :GtagsCursor<CR>


