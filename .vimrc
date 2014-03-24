"if (has("win32"))
    "set diffexpr=MyDiff()
"endif
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction


if(has("win32") || has("win95") || has("win64") || has("win16")) 
    let g:iswindows=1
else
    let g:iswindows=0
endif
autocmd!
set nocompatible
syntax on
if has("autocmd")
    filetype plugin indent on
    filetype plugin on
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent " always set autoindenting on 
endif " has("autocmd")
"vbundle {
    if g:iswindows
        set rtp+=$VIM/vimfiles/vundle/
    else    
        set rtp+=~/.vim/vundle/
    endif
    call vundle#rc()
    Bundle 'L9'
    Bundle 'a.vim'
    Bundle 'ctrlp.vim'
    Bundle 'tacahiroy/ctrlp-funky'
    Bundle 'DoxygenToolkit.vim'
    Bundle 'The-NERD-Commenter'
    " detect file encoding
    Bundle 'mbbill/fencview'
    "for beauty{
    Bundle 'bling/vim-airline'
    Bundle 'Yggdroot/indentLine'
    "}
    Bundle 'scrooloose/nerdtree'

    "colorscheme and highlight{
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'joedicastro/vim-molokai256'
    Bundle 'nielsmadan/harlequin'
    Bundle 'tomasr/molokai'
    Bundle 'TagHighlight'
    "}"
    Bundle 'xolox/vim-misc'
    "snipmate usage {
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    Bundle 'garbas/vim-snipmate'
    Bundle 'honza/vim-snippets'
    "}
    "snippets source 
    Bundle 'Emmet.vim'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'

    Bundle 'scrooloose/syntastic'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'Raimondi/delimitMate'
    Bundle 'marijnh/tern_for_vim'

    Bundle 'Lokaltog/vim-easymotion'
    "for specific files {
    Bundle 'Jinja'
    "}
"}
"common {
    if !g:iswindows
        set encoding=utf-8
        au BufWritePre set fileencoding=utf-8
    endif
    set fileencodings=utf-8,latin1
    set sw=4
    set ts=4
    set sts=4
    set expandtab
    set vb t_vb=
    set autochdir
    set ru
    set number
    syntax enable
    if has("gui_running")
        colorscheme solarized
        if (has("win32"))
            set guifont=Droid Sans Mono:h12:cANSI
            set guifontwide=youYuan:h12:cGB2312
        endif
    else 
        colorscheme harlequin
    endif
    set background=dark
    "if has("gui_running") 
    set guioptions-=m 
    set guioptions-=T 
    set guioptions-=L 
    set guioptions-=r 
    set guioptions-=b 
    "endif 
    set hlsearch 
    set incsearch 
    set backspace=indent,eol,start whichwrap+=<,>,[,] 
    let mapleader=","

    nmap <C-h> <C-w>h 
    nmap <C-j> <C-w>j 
    nmap <C-k> <C-w>k 
    nmap <C-l> <C-w>l 
    nnoremap <leader>oa gg<S-v>G

    autocmd BufEnter * lcd %:p:h
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
"}
"vim-airline {
    set laststatus=2
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'

" }
"NERDTree {
	map <C-e> :NERDTreeToggle<cr>:NERDTreeMirror<cr>
	nmap <leader>nt :NERDTreeFind<cr>
	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
"}
"DoxygenToolkit {
	let g:DoxygenToolkit_paramTag_pre="@param   "
	let g:DoxygenToolkit_returnTag="@returns   "
	let g:DoxygenToolkit_authorName="jiaoew"
"}
"ctrlp {
    let g:ctrlp_working_path_mode = 2
    let g:ctrlp_switch_buffer = 't'
    let g:ctrlp_mruf_include = '\.java$\|\.js$|\.cpp$'
    nnoremap <silent> <A-r> :CtrlPMRU<CR>
    nnoremap <silent> <A-p> :CtrlPBuffer<CR>
    nnoremap <leader>fb :CtrlPBuffer<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }
    let g:ctrlp_extentions = ['funky']
"}
"ctrlp-funky {
    nnoremap <leader>fp :CtrlPFunky<CR>
"}
"vim-javascript {
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
"}
"vim-session {
    let g:session_autoload="yes"
    let g:session_autosave="yes"
"}
"youcompleteme {
    "let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_key_list_select_completion=['<Down>']
    let g:ycm_key_list_previous_completion=['<Up>']
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_extra_conf_globlist = ['~/workspace/practice/.ycm_extra_conf.py']
    nmap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    
"}
"syntastic { 
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = 'w'
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_python_checkers = ['flake8']
    let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_file': [], 'passive_file': [] }
"}
"snipmate {
    let g:snip_author="jiaoew"
"}
" tern for vim {
    nnoremap <leader>td :TernDef<CR>
    nnoremap <leader>tr :TernRefs<CR>
" }
