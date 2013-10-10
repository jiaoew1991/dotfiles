if (has("win32"))
    set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


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
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'Yggdroot/indentLine'
    "}
    Bundle 'Tagbar'
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
    " git {
    Bundle 'tpope/vim-fugitive'
    " }

    Bundle 'xolox/vim-session'
    Bundle 'scrooloose/syntastic'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'Raimondi/delimitMate'

    Bundle 'mileszs/ack.vim'
    Bundle 'Lokaltog/vim-easymotion'
    "for specific files {
    Bundle 'othree/javascript-libraries-syntax.vim'
    Bundle 'marijnh/tern_for_vim'
    Bundle 'pangloss/vim-javascript'
    Bundle 'jade.vim'
    Bundle 'Jinja'
    Bundle 'verilog.vim'
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
    "set guifont=MyFont_for_Powerline
    "set guifont=Consolas_for_Powerline:h12:cANSI
    syntax enable
    if has("gui_running")
        colorscheme solarized
        if (has("win32"))
            set guifont=Courier_New:h12:cANSI
            set guifontwide=youYuan:h12:cGB2312
        else 
            set guifont=Courier\ New\ 12
        endif
    else 
        colorscheme harlequin
    endif
    colorscheme harlequin
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
"powerline{
	set laststatus=2
	set t_Co=256
    "let g:Powerline_symbols='fancy'
"}
"Tagbar {
    nnoremap <silent> <F9> :TagbarToggle<CR>
"}
"ctags and cscope{
	map <C-F12> :call Do_CsTag()<CR>
	nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
	nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
	nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	function Do_CsTag()
	    let dir = getcwd()
	    if filereadable("tags")
		if(g:iswindows==1)
		    let tagsdeleted=delete(dir."\\"."tags")
		else
		    let tagsdeleted=delete("./"."tags")
		endif
		if(tagsdeleted!=0)
		    echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
		    return
		endif
	    endif
	    if has("cscope")
		silent! execute "cs kill -1"
	    endif
	    if filereadable("cscope.files")
		if(g:iswindows==1)
		    let csfilesdeleted=delete(dir."\\"."cscope.files")
		else
		    let csfilesdeleted=delete("./"."cscope.files")
		endif
		if(csfilesdeleted!=0)
		    echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
		    return
		endif
	    endif
	    if filereadable("cscope.out")
		if(g:iswindows==1)
		    let csoutdeleted=delete(dir."\\"."cscope.out")
		else
		    let csoutdeleted=delete("./"."cscope.out")
		endif
		if(csoutdeleted!=0)
		    echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
		    return
		endif
	    endif
	    if(executable('ctags'))
		silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
	    endif
	    if(executable('cscope') && has("cscope") )
		if(g:iswindows!=1)
		    silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
		else
		    silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		endif
		silent! execute "!cscope -b"
		execute "normal :"
		if filereadable("cscope.out")
		    execute "cs add cscope.out"
		endif
	    endif
	endfunction
"}
"DoxygenToolkit {
	let g:DoxygenToolkit_paramTag_pre="@param   "
	let g:DoxygenToolkit_returnTag="@returns   "
	let g:DoxygenToolkit_authorName="jiaoew"
"}
"ZenCoding{
	let g:user_zen_settings = {
	\  'lang' : 'zh',
	\}
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

    "version control
    "let g:ctrlp_user_command = {
    "\ 'types': {
        "\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        "\ 2: ['.hg', 'hg --cwd %s locate -i .'],
    "\ },
    "\ 'fallback': 'dir %s /-n /b /s /a-d' " Windows
    "\ }
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
    let g:ycm_extra_conf_globlist = ['~/ficus/*']
    nmap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    
"}
"snipmate {
    let g:snip_author="jiaoew"
"}
" javascipt syntax {
    autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0
" }
" tern for vim {
    nnoremap <leader>td :TernDef<CR>
    nnoremap <leader>tr :TernRefs<CR>
" }
