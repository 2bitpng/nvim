set number
set autoindent          "改行時に前の行のインデントを計測
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する 
set cindent             "Cプログラムファイルの自動インデントを始める
set smarttab            "新しい行を作った時に高度な自動インデントを行う
set expandtab           "タブ入力を複数の空白に置き換える 

set tabstop=2           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=2        "自動インデントで入る空白数
set softtabstop=0       "キーボードから入るタブの数
set cinoptions+=L0      "C++のラベルにより改行を無効にする

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=0 sts=-1 ts=2 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif

"key setting
noremap! <C-j> <esc>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ` ``<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
tnoremap <Esc> <C-\><C-n>
"--------plugin---------"
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'vim-airline/vim-airline'
call plug#end()
"-----------------------"
"vimtex setting
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
filetype plugin indent on
syntax enable
let g:tex_flavor = "latex"
let maplocalleader=' '

"vim airline
"let g:airline_theme = 'luna'               " テーマの指定
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
"python path

"vim-beter-sml"
Plug 'jez/vim-better-sml'

let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
""改行時のコメントアウトを無効
set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro
filetype plugin on
augroup setAutoCompile
    autocmd!
    autocmd BufWritePost *.cpp if expand('%:p:h') =~# '/atcoder$' | !g++-12 -DLOCAL -Wall %:p
augroup END
augroup setAutoCompile
    autocmd!
    autocmd BufWritePost *.cpp if expand('%:p:h') =~# '/noko/' | !g++-12 -DLOCAL -Wall %:p
augroup END
"autocmd BufWritePost *.cpp !g++-12 -DLOCAL -Wall -D_GLIBCXX_DEBUG  -ftrapv -fstack-protector-all %:p
"autocmd BufWritePost *.cpp !g++-12 -DLOCAL -Wall -D_GLIBCXX_DEBUG  -ftrapv -fstack-protector-all %:p
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

""set viewoptions-=options
"termnl関連の設定
command! Spt below split | terminal
tnoremap <C-j> <C-\><C-n>
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END
