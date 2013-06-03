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


if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
syntax on"打开高亮
if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
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
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
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
        set guioptions-=m " 隐藏菜单栏 
        set guioptions-=T " 隐藏工具栏 
        set guioptions-=L " 隐藏左侧滚动条 
        set guioptions-=r " 隐藏右侧滚动条 
        set guioptions-=b " 隐藏底部滚动条 
        "set showtabline=0 " 隐藏Tab栏 
    endif 
    "set nowrap "不自动换行
    set hlsearch "高亮显示结果
    set incsearch "在输入要搜索的文字时，vim会实时匹配
    set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
    let mapleader=","

    "set foldenable              " 开始折叠 
    "set foldmethod=syntax       " 设置语法折叠 
    "set foldcolumn=0            " 设置折叠区域的宽度 
    "setlocal foldlevel=1        " 设置折叠层数为 
    "set foldmethod=indent 
    "set foldexpr=1 		    "设置代码块折叠后显示的行数 

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
	let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
	let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
	let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
	let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
	let Tlist_Ctags_Cmd='ctags'  	       "设置ctags命令的位置
	nnoremap <leader>tl :Tlist<CR>         "设置关闭和打开taglist窗口的快捷键
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
	"F4和shift+F4调用FuzzyFinder命令行菜单"
	"function! GetAllCommands()
	  "redir => commands
	  "silent command
	  "redir END
	  "return map((split(commands, "\n")[3:]),
	      "\      '":" . matchstr(v:val, ''^....\zs\S*'')')
	"endfunction
	"" 自定义命令行
	"let g:fuf_com_list=[':FufBuffer',':FufFile',':FufCoverageFile',':FufDir',
		    "\':FufMruFile',':FufMruCmd',':FufBookmarkFile',
		    "\':FufBookmarkDir',':FufTag',':FufBufferTag',
		    "\':FufTaggedFile',':FufJumpList',':FufChangeList',
		    "\':FufQuickfix',':FufLine',':FufHelp',
		    "\":FufFile \<C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]\<CR>",
		    "\":FufDir \<C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]\<CR>",
		    "\]       
	"nnoremap <silent> <S-F4> :call fuf#givencmd#launch('', 0, '选择命令>', GetAllCommands())<CR>
	"nnoremap <silent> <F4> :call fuf#givencmd#launch('', 0, '选择命令>', g:fuf_com_list)<CR>
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
