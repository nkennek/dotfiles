" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" 自動補完
NeoBundle 'Shougo/neocomplete.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化(うまく動かない？)
NeoBundle 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
NeoBundle 'KohPoll/vim-less'

NeoBundle 'ujihida/neco-lock'

NeoBundle 'Shougo/neco-syntax'

NeoBundle 'davidhalter/jedi-vim'

NeoBundle 'Shougo/vimfiler'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

call neobundle#end()

filetype plugin indent on

colorscheme elflord
syntax on

set nowrap

set cursorline
set hlsearch
set ignorecase
set smartcase
set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard+=unnamed

set title
set ambiwidth=double

set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start

set display=lastline
set showmatch
set autowrite
set wrap

"インサートモード時jjで終了
inoremap <silent> jj <ESC>
"正規表現のマッチングをvery magicに
nmap / /\v

"タブ分割関連
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H


" quickrunの設定
""""""""""""""""""""""""""""""
" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
" updatetime が一時的に書き換えられてしまうので注意して下さい
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\}
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


" vim-indent-guidesの設定
""""""""""""""""""""""""""""""
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
""""""""""""""""""""""""""""""

" neocomplete.vimの設定
""""""""""""""""""""""""""""""
if neobundle#tap('neocomplete.vim')
  call neobundle#config({
  \   'depends': ['Shougo/context_filetype.vim', 'ujihisa/neco-look', 'Shougo/neco-syntax'],
  \ })

  " 起動時に有効化
  let g:neocomplete#enable_at_startup = 1
  " 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplete#enable_smart_case = 1
  " _(アンダースコア)区切りの補完を有効化
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#enable_camel_case_completion  =  1
  " ポップアップメニューで表示される候補の数
  let g:neocomplete#max_list = 20
  " シンタックスをキャッシュするときの最小文字長
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " 補完を表示する最小文字数
  let g:neocomplete#auto_completion_start_length = 2
  " preview window を閉じない
  let g:neocomplete#enable_auto_close_preview = 0
  " 候補一番目を選択状態でポップアップ
  let g:neocomplete#enable_auto_select = 1
  " 最大一致長
  let g:neocomplete#max_keyword_width = 10000

  "if !exists('g:neocomplete#delimiter_patterns')
  "  let g:neocomplete#delimiter_patterns= {}
  "endif
  "let g:neocomplete#delimiter_patterns.ruby = ['::']

  "if !exists('g:neocomplete#same_filetypes')
  "  let g:neocomplete#same_filetypes = {}
  "endif
  "let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

"  call neocomplete#custom#source('look', 'min_pattern_length', 1)

  call neobundle#untap()
endif
""""""""""""""""""""""""""""""

" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap :buffer<CR> :Unite buffer<CR>
" ファイル一覧
noremap :ls<CR> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap :mru<CR> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff<CR> :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" yank historyを開く"
" nnoremap <silent> ,uy<CR> :<C-u>Unite history/yank<CR>
" ディレクトリ捜索
nnoremap :cd<CR> :<C-u>Unite
      \ -start-insert -default-action=vimfiler
      \ directory directory_mru directory_rec/async
      \ <CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> :split unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> :split unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> :vsplit unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> :vsplit unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" jedi-vimの設定＋neocomplete.vimの連携
""""""""""""""""""""""""""""""
" docstringを表示しない
" autocmd FileType python setlocal completeopt-=preview
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
"
" if !exists('g:neocomplete#force_omni_input_patterns')
"         let g:neocomplete#force_omni_input_patterns = {}
" endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" see a diff between the currently edited file and its unmodified version in the filesystem
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diff call s:DiffWithSaved()
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
""""""""""""""""""""""""""""""

" 括弧・文字列の開き記号を削除した時、隣接した閉じ記号を削除する
""""""""""""""""""""""""""""""
function! DeleteParenthesesAdjoin()
    let pos = col(".") - 1 " カーソルの位置
    let rowchars = getline(".") " カーソル行の文字列
    let parentLList = ["(", "[", "{", "\'", "\""]
    let parentRList = [")", "]", "}", "\'", "\""]
    let cnt = 0
    let output = ""

    if pos == strlen(rowchars)
        return "\b"
    endif
    for c in parentLList
        if rowchars[pos-1] == c && rowchars[pos] == parentRList[cnt]
            call cursor(line("."), pos + 2)
            let output = "\b"
            break
        endif
        let cnt += 1
    endfor
    return output."\b"
endfunction

inoremap <silent> <BS> <C-R>=DeleteParenthesesAdjoin()<CR>

" ノーマルモード時のみセミコロンとコロンを入れ替える(USキーボード用の設定)
""""""""""""""""""""""""""""""
nnoremap ; :
nnoremap : ;

""""""""""""""""""""""""""""""

" ノーマルモードでセミコロンを押したときに、文末にセミコロンを入力
""""""""""""""""""""""""""""""
" nnoremap ; $a;<ESC>
"
""""""""""""""""""""""""""""""

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on

