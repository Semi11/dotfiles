"<<<encode>>>  {{{1
"vimの内部文字文字コードをUFT-8に設定
set encoding=utf-8
"読み込み時の文字コードを設定(左から順に試行し、最初に成功した文字コードで読み込む)
set fileencodings=iso-2022-jp,cp932,euc-jp,sjis,utf-8
"改行コードの判別
set fileformats=unix,dos,mac


"<<<file>>>  {{{1
set nobackup
"スワップファイルを作らない
set noswapfile
"ファイルを開き直してもundoできるようにする
set undofile
"undoファイルの置き場所
set undodir=~/.vim/undo/
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge
"新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
"モードラインを有効にする
:set modeline
"3行目までをモードラインとして検索する
set modelines=4
"vimrcを自動再読み込み
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
augroup end
"ファイルを開いたとき最後にカーソルがあった位置に移動する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g'\"" | endif
augroup end
"クリップボードを使用(Linux)
set clipboard=unnamedplus
" バックスペースで各種消せるようにする
set backspace=indent,eol,start


"<<<visual>>>  {{{1
"カラー
syntax enable
"colorsceheme
colorscheme molokai
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
"一行の文字数が多くてもきちんと描画されるようになる
set display=lastline
"補完メニューの高さを10に
set pumheight=10
"括弧を入力したとき、対応する括弧に一瞬カーソルがとぶ
set showmatch
"カーソルが飛ぶ時間を0.1*x倍に設定
set matchtime=1
"スクロール送りを開始する前後の行数を指定
set scrolloff=10
"エラービープ音の全停止
set visualbell t_vb=
set noerrorbells
"全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
"スクロールバーを消す
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
"ウィンドウより長い行は折り返され、次の行に続けて表示される
set wrap
"一行の文字数が多くてもきちんと描画する
set display=lastline
"補完メニューの高さを制限
set pumheight=10

"indent
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する。
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
"makefile編集時noexpandtabする
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

" Tab
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2



"<<<serch>>>  {{{1
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
"検索結果の対象を中央に表示
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
"置換時のgオプションをデフォルトで有効化する
set gdefault
"%拡張
source $VIMRUNTIME/macros/matchit.vim


"<<<map>>>  {{{1
"数字のインクリメント、デクリメントへのマッピング
nnoremap + <C-a>
nnoremap - <c-x>
"インサートモードのEscをjjにキーバインド
inoremap <silent> jj <esc>
"Enterキーで空行を挿入
nnoremap <CR> o<ESC>
"Spaceキーで半角スペースを挿入
nnoremap <Space> i<Space><ESC>l
"zKeyで上書き保存
nnoremap z :w<CR>
"UpAllowKeyでコマンドの履歴を辿る
noremap <Up> :<UP>
"左右のカーソル移動において、行を跨いで移動できるようにするオプション
set whichwrap=b,s,h,l,<,>,[,],~
"Yを行末までのヤンクにする
nnoremap Y y$
";でコマンドモードに移動可能にする
noremap ; :
" 折り返し時に表示行単位での移動できるようにする
noremap j gj
noremap k gk
"vim-altrにより必要ファイルへジャンプ
nmap <F2> <Plug>(altr-forward)

"<<<auto-complete>>> {{{1
"http://io-fia.blogspot.com/2012/11/vimvimrc.html
" set completeopt=menuone
" for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"   exec "imap " . k . " " . k . "<C-N><C-P>"
" endfor
"
" imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"<<<c++>>> {{{1
"c++ library include path
setlocal path+=/usr/include/c++/5.4.0/

"<<<vim-plug>>> {{{1
"vim-plug(プラグインマネージャの設定)
call plug#begin()
"ここにプラグインを追加"
Plug 'kana/vim-altr' "http://labs.timedia.co.jp/2011/07/vim-altr.html
Plug 'tyru/caw.vim'
Plug 'shougo/neocomplete'
Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'
Plug 'reireias/vim-cheatsheet'
Plug 'rcmdnk/vim-markdown' "https://rcmdnk.com/blog/2013/11/17/computer-vim
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'alvan/vim-closetag'
call plug#end()

"<<<plugins>>> {{{1
"<<<vim-altr>>> {{{2
"ディレクトリ分けされていても移動できるようにする
call altr#define('Src/%.c%','Inc/%.h%')

"<<<caw.vim>>> {{{2
" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:zeropos:toggle)
vmap \c <Plug>(caw:zeropos:toggle)

" \C でコメントアウトの解除
nmap \C <plug>(caw:hatpos:uncomment)
vmap \C <plug>(caw:hatpos:uncomment)

"<<<neocomplete>>> {{{2
" 補完を有効にする
let g:neocomplete#enable_at_startup = 1

" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""

inoremap <expr><C-i>     neocomplete#complete_common_string()

" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 2文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 2
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

"<<<neosnippet>>> {{{2
" スニペットを展開するキーマッピング
" <ENTER> で選択されているスニペットの展開を行う
" 選択されている候補がスニペットであれば展開し、
" それ以外であれば次の候補を選択する
" <TAB>で候補を選択
" また、既にスニペットが展開されている場合は次のマークへと移動する
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-y>" : "\<CR>"

imap <expr> <TAB> pumvisible() ? "\<Down>" : neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"


" 現在の filetype のスニペットを編集する為のキーマッピング
" こうしておくことでサッと編集や追加などを行うことができる
" 以下の設定では新しいタブでスニペットファイルを開く
nnoremap <Space>ns :execute "tabnew\|:NeoSnippetEdit ".&filetype<CR>


" スニペットファイルの保存ディレクトリを設定
let g:neosnippet#snippets_directory = "~/.neosnippet"

"<<<vim-cheatsheat>>> {{{2
let g:cheatsheet#cheat_file = '~/.vimcheatsheet.md'

"<<<markdown>>> {{{2
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
" Need: kannokanno/previm
nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
" 自動で折りたたまないようにする
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 1

"<<vim-closetag>>> {{{2
let g:closetag_filenames = '*.html, *.html.erb, *.vue'

"<<<modeline>>>  {{{1
"makerで折りたたむようにする
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
" vim: commentstring="%s
