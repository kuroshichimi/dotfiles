:syntax on
:set autoindent
:set expandtab
:set smartcase
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set textwidth=0
:set wrap
:set wrapscan
:set wildmenu
:set showmatch
:set number
:set ruler
:set list
:set listchars=tab:>-,extends:<,trail:-
:set laststatus=2
:set showcmd
:set nobackup
:set writebackup
:set clipboard=unnamed,autoselect
:set hlsearch
:set incsearch
:set fileencodings=utf-8,sjis,euc-jp,cp932

:set cursorline
:set cursorcolumn

" Leader
:let mapleader = "\<Space>"
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P
nnoremap <Leader>d "_d

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

nnoremap L $
nnoremap H 0

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap s[ :bprevious<CR>
nnoremap s] :bnext<CR>
nnoremap <Leader>n nzz
nnoremap <Leader>N Nzz

if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tomasr/molokai'

NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nelstrom/vim-visual-star-search'

NeoBundle 'Shougo/unite.vim'
    nnoremap sT :<C-u>Unite tab<CR>
NeoBundle 'Shougo/vimfiler'
    nnoremap sf :<C-u>VimFiler -split -simple -winwidth=25 -no-quit<CR>
    let g:vimfiler_enable_auto_cd = 1
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kana/vim-submode'

NeoBundle 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=240
    let g:indent_guides_guide_size=1

NeoBundle 'marijnh/tern_for_vim', {
            \ 'build':{
            \   'others': 'npm install'
            \ }}

NeoBundle 'Shougo/neocomplcache'
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    hi Pmenu ctermbg=53
    hi PmenuSel ctermbg=9
    hi PMenuSbar ctermbg=53

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
	let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif

NeoBundle 'scrooloose/syntastic'
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'

let g:syntastic_javascript_checkers=['eslint']

" " エラー行に sign を表示
let g:syntastic_enable_signs = 1
" " location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" " location list を常に表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" " :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0

call neobundle#end()

:colorscheme molokai
:set background=dark

" for submode
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" Required:
filetype plugin indent on

NeoBundleCheck

" lightline settings
" cut and paste from http://itchyny.hatenablog.com/entry/20130828/1377653592
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [
			\     [ 'mode', 'paste' ],
			\     [ 'fugitive', 'filename' ] ],
			\   'right': [
			\     ['lineinfo', 'syntastic'],
			\     ['percent'],
			\     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
			\   ]
			\ },
			\ 'component_function': {
			\   'modified': 'LightLineModified',
			\   'readonly': 'LightLineReadonly',
			\   'fugitive': 'LightLineFugitive',
			\   'filename': 'LightLineFilename',
			\   'fileformat': 'LightLineFileformat',
			\   'filetype': 'LightLineFiletype',
			\   'fileencoding': 'LightLineFileencoding',
			\   'mode': 'LightLineMode'
			\ },
			\ }

function! LightLineModified()
	return winwidth(0) > 70 ? (&ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-') : ''
endfunction

function! LightLineReadonly()
	return winwidth(0) > 70 ? (&ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : '') : ''
endfunction

function! LightLineFilename()
	return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
				\ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
	if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
		return fugitive#head()
	else
		return ''
	endif
endfunction

function! LightLineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
	return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" if executable('ag')
" 	let g:unite_source_grep_command = 'ag'
" 	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column -S'
" 	let g:unite_source_grep_recursive_opt = ''
" endif

:set viminfo='1000,f1,<500,\"10000
