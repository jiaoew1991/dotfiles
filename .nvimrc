if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

let g:python_host_prog='/usr/local/bin/python'

" plugin manager {
    call plug#begin('~/.vim/bundle')

    Plug 'L9'
    Plug 'a.vim'
    Plug 'ctrlp.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
    Plug 'DoxygenToolkit.vim', { 'on': 'Dox' }
    Plug 'The-NERD-Commenter'
    Plug 'CodeFalling/fcitx-vim-osx'
    "for beauty{
    Plug 'bling/vim-airline'
    "}
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    "for git {
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'gregsexton/gitv', { 'on': 'Gitv' }
    "}
    "
    "colorscheme and highlight{
    Plug 'altercation/vim-colors-solarized'
    Plug 'd11wtq/tomorrow-theme-vim'
    Plug 'kien/rainbow_parentheses.vim'
    "}"

    Plug 'xolox/vim-misc'
    "snipmate usage {
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'
    "}
    Plug 'Emmet.vim'

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'

    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'Raimondi/delimitMate'
    Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

    Plug 'Lokaltog/vim-easymotion'
    "for specific files {
    Plug 'Jinja', { 'for': 'html' }
    Plug 'pangloss/vim-javascript' , { 'for': 'javascript' }
    Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
    Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
    Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    Plug 'mxw/vim-jsx', { 'for': 'javascript' }
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
    "}

    Plug 'editorconfig/editorconfig-vim'
    Plug 'smeggingsmegger/ag.vim', { 'on': 'Ag' }
    Plug 'rizzatti/dash.vim', { 'on': 'Dash' }

    " rest client
    Plug 'aquach/vim-http-client'
    Plug 'benekastah/neomake', { 'on': 'Neomake' }
    Plug 'jiaoew1991/neoterm'
    Plug 'mhinz/vim-startify'

    call plug#end()
" }

augroup common
    au BufWritePre set fileencoding=utf-8

    syntax enable
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on

    set shell=zsh
    set fileencodings=utf-8,latin1
    set sw=4
    set ts=4
    set sts=4
    set expandtab
    set vb t_vb=
    set autochdir
    set ru
    set number
    set background=dark

    colorscheme solarized
    if (g:iswindows)
        set guifont=Droid Sans Mono:h12:cANSI
        set guifontwide=youYuan:h12:cGB2312
    endif

    set cursorline
    set cursorcolumn
    let mapleader=","

    set foldmethod=indent
    set nofoldenable

    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l
    imap jk <Esc>

    autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt
    noremap <leader>0 :tablast<cr>
augroup END

augroup vim-airline
    let g:airline_powerline_fonts = 1
augroup END

augroup NERDTree
	map <C-e> :NERDTreeToggle<cr>:NERDTreeMirror<cr>
	nmap <leader>nt :NERDTreeFind<cr>
	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let NERDTreeAutoDeleteBuffer=1
    let g:nerdtree_tabs_open_on_gui_startup=0
augroup END

augroup DoxygenToolkit
	let g:DoxygenToolkit_paramTag_pre="@param   "
	let g:DoxygenToolkit_returnTag="@returns   "
	let g:DoxygenToolkit_authorName="jiaoew"
augroup END

augroup ctrlp
    let g:ctrlp_working_path_mode = 2
    let g:ctrlp_switch_buffer = 't'
    nnoremap <silent> <A-r> :CtrlPMRU<CR>
    nnoremap <leader>fb :CtrlPBuffer<CR>
    set wildignore+=*.o,*.pyc,*.class,*/target/**,*/bin/**,*/.idea/**,*/env/**,*/node_modules/**
    "let g:ctrlp_custom_ignore = { \
        "\ 'dir':  '\.git$\|\.hg$\|\.svn$|target$|bin$',
        "\ 'file': '\.exe$\|\.so$\|\.dll$|\.class$|\.o|\.pyc'
        "\}
    let g:ctrlp_extentions = ['funky']
augroup END

augroup ctrip-funcky
    nnoremap <leader>fp :CtrlPFunky<CR>
augroup END

augroup youcompleteme
    let g:ycm_key_list_select_completion=['<Down>']
    let g:ycm_key_list_previous_completion=['<Up>']
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_confirm_extra_conf=0
    let g:ycm_seed_identifiers_with_syntax=1
    nmap <leader>jd :YcmCompleter GoTo<CR>

    let g:EclimCompletionMethod = 'omnifunc'
augroup END

augroup snipmate
    let g:snips_author="jiaoew"
    let g:snips_email="jiaoew2011@gmail.com"
    let g:snips_github="http://github.com/jiaoew1991"
augroup END

augroup tern_for_vim
    nnoremap <leader>td :TernDef<CR>
    nnoremap <leader>tr :TernRefs<CR>
augroup END

augroup racer
    let g:racer_cmd = "/Users/jiaoew/thirdparty/rust/vendor/racer/target/release/racer"
    let $RUST_SRC_PATH="/Users/jiaoew/thirdparty/rust/src/"
augroup END

augroup fugitive
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gp :Gpush<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gl :Glog<CR>
    nnoremap <leader>gw :Gwrite<CR>
augroup END

augroup gitgutter
    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1
augroup END

augroup vim-session
    let g:session_autosave = 'yes'
    let g:session_autoload = 'yes'
augroup END

augroup rainbow
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END

augroup delimiter
    let delimitMate_expand_cr = 1
augroup END

augroup vim-jsx
    let g:jsx_ext_required = 0
augroup END

augroup typescript-js
    autocmd BufNewFile,BufRead *.ts     set filetype=typescript
    autocmd BufNewFile,BufRead *.tsx    set filetype=typescript
augroup END

augroup neoterm
    let g:neoterm_automap_keys = '<leader>te'
    " run set test lib
    nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
    nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
    nnoremap <silent> <leader>rn :call neoterm#test#run('current')<cr>
    nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>

    " Useful maps
    " clear terminal
    nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
    " kills the curren<leader> job (send a <c-c>)
    nnoremap <silent> <leader>tc :call neoterm#kill()<cr>

augroup END
