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


if(has("win32") || has("win95") || has("win64") || has("win16")) "�ж���ǰ����ϵͳ����
    let g:iswindows=1
else
    let g:iswindows=0
endif
set nocompatible "��Ҫvimģ��viģʽ���������ã�������кܶ಻���ݵ�����
syntax on"�򿪸���
if has("autocmd")
    filetype plugin indent on "�����ļ���������
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
    "������������Ӧ����cindent���ٷ�˵autoindent����֧�ָ����ļ�������������Ч�����ֻ֧��C/C++��cindentЧ�����һ�㣬�����߲�û�п�����
    set autoindent " always set autoindenting on 
endif " has("autocmd")
"vbundle {
    if g:iswindows
        set rtp+=$VIM/vimfiles/bundle/vundle/
    else    
        set rtp+=~/.vim/bundle/vundle/
    endif
    call vundle#rc()
    Bundle 'L9'
    Bundle 'a.vim'
    Bundle 'AutoComplPop'
    Bundle 'ctrlp.vim'
    Bundle 'DoxygenToolkit.vim'
    Bundle 'The-NERD-Commenter'
    Bundle 'snipMate'
    Bundle 'Tagbar'
    Bundle 'taglist.vim'
    Bundle 'verilog.vim'
    Bundle 'Solarized'
    Bundle 'jade.vim'
    Bundle 'tomtom/tlib_vim'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'honza/vim-snippets'
    Bundle 'scrooloose/nerdtree'
    Bundle 'pangloss/vim-javascript'
    Bundle 'Lokaltog/powerline'
    Bundle 'xolox/vim-session'
    Bundle 'tomasr/molokai'
    Bundle 'ZenCoding.vim'
    Bundle 'TagHighlight'
    Bundle 'OmniCppComplete'
"}
"common {
    "call pathogen#infect()
    au BufWritePre set fileencoding=utf-8
    set fileencodings=utf-8,latin1
    set sw=4
    set ts=4
    set sts=4
    set expandtab
    set vb t_vb=
    set autochdir
    set ru
    set number
    set guifont=Courier_New:h12:cANSI
    set guifontwide=youYuan:h12:cGB2312
    "set guifont=MyFont_for_Powerline
    "set guifont=Consolas_for_Powerline:h12:cANSI
    "colorscheme desert
    "colorscheme solarized
    colorscheme molokai
    syntax enable
    set background=dark
    if has("gui_running") 
        set guioptions-=m " ���ز˵��� 
        set guioptions-=T " ���ع����� 
        set guioptions-=L " ������������ 
        set guioptions-=r " �����Ҳ������ 
        set guioptions-=b " ���صײ������� 
        "set showtabline=0 " ����Tab�� 
    endif 
    "set nowrap "���Զ�����
    set hlsearch "������ʾ���
    set incsearch "������Ҫ����������ʱ��vim��ʵʱƥ��
    set backspace=indent,eol,start whichwrap+=<,>,[,] "�����˸����ʹ��
    let mapleader=","

    "set foldenable              " ��ʼ�۵� 
    "set foldmethod=syntax       " �����﷨�۵� 
    "set foldcolumn=0            " �����۵�����Ŀ�� 
    "setlocal foldlevel=1        " �����۵�����Ϊ 
    "set foldmethod=indent 
    "set foldexpr=1 		    "���ô�����۵�����ʾ������ 

    nmap <C-h> <C-w>h 
    nmap <C-j> <C-w>j 
    nmap <C-k> <C-w>k 
    nmap <C-l> <C-w>l 

    autocmd BufEnter * lcd %:p:h
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
"taglist{
	let Tlist_Show_One_File = 1            "ֻ��ʾ��ǰ�ļ���taglist��Ĭ������ʾ���
	let Tlist_Exit_OnlyWindow = 1          "���taglist�����һ�����ڣ����˳�vim
	let Tlist_Use_Right_Window = 1         "���Ҳര������ʾtaglist
	let Tlist_GainFocus_On_ToggleOpen = 1  "��taglistʱ����걣����taglist����
	let Tlist_Ctags_Cmd='ctags'  	       "����ctags�����λ��
	nnoremap <leader>tl :Tlist<CR>         "���ùرպʹ�taglist���ڵĿ�ݼ�
"}
"Tagbar {
    nnoremap <silent> <F9> :TagbarToggle<CR>
"}
"ctags and cscope{
    set tags+=$VIM/vimfiles/tags/stl_tags
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
		"silent! execute "!ctags -R --c-types=+p --fields=+S *"
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
	let g:DoxygenToolkit_briefTag_pre="@Synopsis   "
	let g:DoxygenToolkit_paramTag_pre="@Param   "
	let g:DoxygenToolkit_returnTag="@Returns   "
	let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
	let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
	let g:DoxygenToolkit_authorName="jiaoew"
	"let g:DoxygenToolkit_licenseTag="My own license" 
"}
"ZenCoding{
	let g:user_zen_settings = {
	\  'lang' : 'zh',
	\}
"}
"FuzzFinder {
	"F4��shift+F4����FuzzyFinder�����в˵�"
	"function! GetAllCommands()
	  "redir => commands
	  "silent command
	  "redir END
	  "return map((split(commands, "\n")[3:]),
	      "\      '":" . matchstr(v:val, ''^....\zs\S*'')')
	"endfunction
	"" �Զ���������
	"let g:fuf_com_list=[':FufBuffer',':FufFile',':FufCoverageFile',':FufDir',
		    "\':FufMruFile',':FufMruCmd',':FufBookmarkFile',
		    "\':FufBookmarkDir',':FufTag',':FufBufferTag',
		    "\':FufTaggedFile',':FufJumpList',':FufChangeList',
		    "\':FufQuickfix',':FufLine',':FufHelp',
		    "\":FufFile \<C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]\<CR>",
		    "\":FufDir \<C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]\<CR>",
		    "\]       
	"nnoremap <silent> <S-F4> :call fuf#givencmd#launch('', 0, 'ѡ������>', GetAllCommands())<CR>
	"nnoremap <silent> <F4> :call fuf#givencmd#launch('', 0, 'ѡ������>', g:fuf_com_list)<CR>
"}
"ctrlp {
    let g:ctrlp_working_path_mode = 2
    let g:ctrlp_switch_buffer = 't'
    "nnoremap <silent> <D-t> :CtrlP<CR>
    let g:ctrlp_mruf_include = '\.java$\|\.js$|\.cpp$'
    nnoremap <silent> <A-r> :CtrlPMRU<CR>
    nnoremap <silent> <A-p> :CtrlPBuffer<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }

    "version control
    "let g:ctrlp_user_command = {
    "\ 'types': {
        "\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        "\ 2: ['.hg', 'hg --cwd %s locate -i .'],
    "\ },
    "\ 'fallback': 'dir %s /-n /b /s /a-d' " Windows
    "\ }
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
"omnicppComplete {
    let OmniCpp_MayCompleteDot = 1 " autocomplete with .
    let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
    let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
    let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
    let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window   
"}
