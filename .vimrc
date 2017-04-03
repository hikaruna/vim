" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


" Required:
filetype plugin indent on


"vim-zuickrunの有効化
let g:quickrun_config = { '_': {} }
let g:quickrun_config['_']['outputter/buffer/split'] = ':botright 8sp' " 一番下にウィンドウを分割させて出力
let g:quickrun_config['_']['outputter/buffer/close_on_empty'] = 1 " 出力がなかった場合に出力バッファを自動的に閉じる
" let g:quickrun_config['coffee'] = {'command': 'coffee', 'exec': ['%c -cbp %s']}
let g:quickrun_config['json'] = {'command': 'jq', 'exec': ['%c . %s']}
let g:quickrun_config['html'] = {'command': 'w3m', 'exec': ['%c %s']}
nnoremap <C-\> :QuickRun<CR>

" es6 babelコンバートのショートカット
"nnoremap <C-\> :Babel vert<CR>

let g:seiya_auto_enable=1 " 背景の透過をするプラグインを有効化
"let g:hybrid_use_iTerm_colors = 1
"colorscheme hybrid
"colorscheme elflord
"colorscheme solarized

"molokai===
colorscheme molokai
let g:molokai_original = 1
set background=light
let g:rehash256 = 1
"===molokai

let g:vim_markdown_folding_disabled=1 " 'plasticboy/vim-markdown' の自動折り畳みをOFF

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Powerline " 動かない 参考 http://qiita.com/tkhr/items/8cc17c02dea1803be9c6
" 動かないから封印
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set laststatus=2
"set showtabline=2
"set noshowmode

" vモードの置換連続ペースト用
function! Put_text_without_override_register()
  let line_len = strlen(getline('.'))
  execute "normal! `>"
  let col_loc = col('.')
  execute 'normal! gv"_x'
  if line_len == col_loc
    execute 'normal! p'
  else
    execute 'normal! P'
  endif
endfunction
xnoremap <silent> p :call Put_text_without_override_register()<CR>

syntax on
set autoindent
set number
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set ruler "何行目の何列目かを表示
set hlsearch "検索結果をハイライトする
set nowrapscan "下まで検索したら最初に戻らない
set directory=~/.vim/tmp "スワップファイルを作成するディレクトリを指定
set backup "バックアップファイルを作成します
set backupdir=~/.vim/backup "バックアップファイルを保管するディレクトリを指定
set ic "大文字小文字を区別せず検索する
set bs=2 "バックスペースで挿入した場所以前も消せるようにする
set clipboard+=unnamed "ヤンクした時に自動でクリップボードにコピー(autoselectを指定するとvモードの置換連続ペーストができない)

"Escを連打したとき検索結果のハイライトを消す
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>
"tabnew と打つのは疲れるのでviにエイリアス
ca vi tabnew
