if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'w0ng/vim-hybrid' "http://cocopon.me/blog/?p=841 で紹介されてたカラー
NeoBundle 'tomasr/molokai' " 背景が半透明でも見やすいと噂のカラー
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-coffee-script'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'rails.vim'
NeoBundle 'matchit.zip' "HTMLのタグから対応するグへジャンプする
NeoBundle 'tpope/vim-endwise' "rubyのendを自動挿入
NeoBundle 'tpope/vim-haml' "Vim runtime files for Haml, Sass, and SCSS
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'kana/vim-textobj-user' "textobj-xxx系のコア
NeoBundle 'kana/vim-textobj-indent' "インデント系の言語でテキストオブジェクトを有効にする vii
NeoBundle 'tpope/vim-surround' "選択中のテキストを括弧やダブルクォートでくくれる viw S<b> とやると <b>xxx</b> dst とやると xxx
NeoBundle 'nathanaelkane/vim-indent-guides' "インデントに模様
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm' " :PrevimOpen でブラウザに表示
NeoBundle 'tyru/open-browser.vim' "previmで使用
NeoBundle 'slim-template/vim-slim'
NeoBundle 'cakebaker/scss-syntax.vim' " Sassシンタックス
NeoBundle 'digitaltoad/vim-jade' " Jadeシンタックス
NeoBundle 'othree/yajs.vim' " ES6 シンタックス
NeoBundle 'wavded/vim-stylus' " Stylシンタックス
NeoBundle 'evidens/vim-twig' " twigシンタックス
NeoBundle 'vim-scripts/diffchar.vim' "単語単位のdiff F7で起動
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jbgutierrez/vim-babel' "es6 convert
NeoBundle 'mattn/webapi-vim' "es6 convert
NeoBundle 'miyakogi/seiya.vim' " vimの背景色を透明な感じにするらしい


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"neocompleteを有効化 ここから
let g:neocomplete#enable_at_startup = 1

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"neocompleteを有効化 ここまで

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
"colorscheme molokai
"colorscheme hybrid
"colorscheme elflord
colorscheme solarized

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
