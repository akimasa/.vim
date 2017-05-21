" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 22-May-2017.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。GUIに関する設定はgvimrcに書かかれています。
"
" 個人用設定は_vimrcというファイルを作成しそこで行ないます。_vimrcはこのファ
" イルの後に読込まれるため、ここに書かれた内容を上書きして設定することが出来
" ます。_vimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIMよりも
" 優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/vimrc_local.vim)が存在するならば、本設定
" ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"
" 読み込み後、変数g:vimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version


"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=8
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" Copyright (C) 2009-2012 KaoriYa/MURAOKA Taro
" set undodir=~/.vimundo/
set noundofile

" enable local lib.
" let $PERL5LIB="/Users/akimasa/perl5/lib/perl5"
" let $PERL5LIB="/Users/akimasa/perl5/lib/perl5/darwin-thread-multi-2level:/Users/akimasa/perl5/lib/perl5"
" let $PERL5LIB="/Users/akimasa/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

if v:version >= 704
  
  " Required:
  set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim
  
  " プラグインが実際にインストールされるディレクトリ
  let s:dein_dir = expand('~/.vim/dein')
  "
  
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [expand('<sfile>')] + split(glob('~/.vim/*.toml'), '\n'))
  
    " プラグインリストを収めた TOML ファイル
    let s:toml      = '~/.vim/dein.toml'
    let s:lazy_toml = '~/.vim/dein_lazy.toml'
  
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
  
  "End dein Scripts-------------------------
endif
if (has('win32') || has('win64'))
    "use scp
    let g:netrw_scp_cmd     = "pscp.exe -q -batch"
    let g:netrw_sftp_cmd    = "psftp.exe"
    let g:netrw_ssh_cmd     = "plink.exe"
endif
