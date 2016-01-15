if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

    "set columns=3000
    "set lines=3000
"vbundle {
    if g:iswindows
        set rtp+=$VIM/vimfiles/bundle/Vundle.vim
    else
        set rtp+=~/.vim/bundle/Vundle.vim
    endif
    set rtp+=~/.fzf

    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'

    Plugin 'L9'
    Plugin 'a.vim'
    Plugin 'ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'DoxygenToolkit.vim'
    Plugin 'The-NERD-Commenter'
    "for beauty{
    Plugin 'bling/vim-airline'
    "}
    Plugin 'scrooloose/nerdtree'

    "for git {
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'gregsexton/gitv'
    "}
    "
    "colorscheme and highlight{
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'nielsmadan/harlequin'
    Plugin 'd11wtq/tomorrow-theme-vim'
    Plugin 'kien/rainbow_parentheses.vim'
    "}"

    Plugin 'xolox/vim-misc'
    "snipmate usage {
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'honza/vim-snippets'
    "}

    "snippets source
    Plugin 'Emmet.vim'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'

    "Plugin 'scrooloose/syntastic'
    if g:iswindows
        Plugin 'Shougo/neocomplcache'
        Plugin 'Shougo/neocomplcache-clang'
    else
        Plugin 'Valloric/YouCompleteMe'
    endif
    Plugin 'Raimondi/delimitMate'
    Plugin 'marijnh/tern_for_vim'

    Plugin 'Lokaltog/vim-easymotion'
    "for specific files {
    Plugin 'Jinja'
    Plugin 'pangloss/vim-javascript'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'digitaltoad/vim-jade'
    Plugin 'derekwyatt/vim-scala'
    Plugin 'ekalinin/Dockerfile.vim'
    Plugin 'rust-lang/rust.vim'
    Plugin 'mxw/vim-jsx'
    Plugin 'leafgarland/typescript-vim'
    "Plugin 'phildawes/racer'
    "}

    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'smeggingsmegger/ag.vim'
    Plugin 'rizzatti/dash.vim'

    Plugin 'JarrodCTaylor/vim-python-test-runner'

    Plugin 'xolox/vim-session'
    Plugin 'godlygeek/tabular'

    " rest client
    Plugin 'aquach/vim-http-client'

    call vundle#end()
"}
augroup common
    if !g:iswindows
        set encoding=utf-8
        au BufWritePre set fileencoding=utf-8
    endif

    set nocompatible
    syntax enable
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on
    set autoindent " always set autoindenting on

    set fileencodings=utf-8,latin1
    set sw=4
    set ts=4
    set sts=4
    set expandtab
    set vb t_vb=
    set autochdir
    set ru
    set number
    if has("gui_running")
        colorscheme Tomorrow
        if (g:iswindows)
            set guifont=Droid Sans Mono:h12:cANSI
            set guifontwide=youYuan:h12:cGB2312
        endif
    endif

    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b

    set mouse=a
    set hlsearch
    set incsearch
    set wildmenu
    set cursorline
    set cursorcolumn
    set backspace=indent,eol,start whichwrap+=<,>,[,]
    let mapleader=","

    set foldmethod=indent
    set nofoldenable

    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l
    imap jk <Esc>
    nnoremap <leader>sa gg<S-v>G

    autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif
    if &term =~ "xterm\\|rxvt"
        " use an orange cursor in insert mode
        left &t_SI = "\<Esc>]12;green\x7"
        " use a red cursor otherwise
        let &t_EI = "\<Esc>]12;red\x7"
        silent !echo -ne "\033]12;red\007"
        " reset cursor when vim exits
        autocmd VimLeave * silent !echo -ne "\033]112\007"
        " use \003]12;gray\007 for gnome-terminal
    endif

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
    set laststatus=2
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
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
    "let g:ctrlp_mruf_include = '\.java$\|\.js$|\.cpp$|\.py$'
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
    "let g:ycm_extra_conf_globlist = ['~/workspace/practice/.ycm_extra_conf.py']
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

augroup vim_python_test_runner
    nnoremap <leader>nf :NosetestFile<CR>
    nnoremap <leader>nc :NosetestClass<CR>
    nnoremap <leader>nm :NosetestMethod<CR>
    nnoremap <leader>nb :NosetestBaseMethod<CR>
    nnoremap <leader>rr :RerunLastTests<CR>
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
