if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

let g:python_host_prog='/usr/local/bin/python'

" plugin manager {
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
call plug#begin('~/.vim/bundle')

Plug 'L9'
Plug 'a.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'DoxygenToolkit.vim', { 'on': 'Dox' }
Plug 'The-NERD-Commenter'
Plug 'ybian/smartim'
"for beauty{
Plug 'bling/vim-airline'
"}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/tabman.vim'

"for git {
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
"}
"
"colorscheme and highlight{
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'kien/rainbow_parentheses.vim'
"}"

Plug 'xolox/vim-misc'
Plug 'Emmet.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" completions {
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/echodoc.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" }

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

Plug 'aquach/vim-http-client'  " rest client
Plug 'benekastah/neomake'
Plug 'jiaoew1991/neoterm'
Plug 'mhinz/vim-startify'
"Plug 'scrooloose/syntastic'

call plug#end()
" }

augroup common
    au BufWritePre set fileencoding=utf-8

    syntax enable
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on

    set fileencodings=utf-8,latin1
    set sw=4
    set ts=4
    set sts=4
    set expandtab
    set vb t_vb=
    set autochdir
    set ru
    set number
    if(has('gui'))
        set background=dark
    endif

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

augroup deoplete
    let g:deoplete#enable_at_startup = 1

    let g:deoplete#sources = get(g:, 'deoplete#sources', {})
    let g:deoplete#sources.go = ['vim-go']

    let g:deoplete#sources#jedi#statement_length = 1
    let g:deoplete#sources#jedi#show_docstring = 1
    let g:deoplete#sources#jedi#short_types = 1

    let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
    let g:deoplete#ignore_sources.python = ['syntax']

    let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
    let g:deoplete#omni#functions.php = 'phpcomplete_extended#CompletePHP'
    let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
    let g:deoplete#omni#functions.html = 'htmlcomplete#CompleteTags'
    let g:deoplete#omni#functions.markdown = 'htmlcomplete#CompleteTags'

    call deoplete#custom#set('buffer',        'mark', 'ℬ')
    call deoplete#custom#set('tag',           'mark', '⌦')
    call deoplete#custom#set('omni',          'mark', '⌾')
    call deoplete#custom#set('ternjs',        'mark', '⌁')
    call deoplete#custom#set('jedi',          'mark', '⌁')
    call deoplete#custom#set('vim',           'mark', '⌁')
    call deoplete#custom#set('neosnippet',    'mark', '⌘')
    call deoplete#custom#set('around',        'mark', '⮀')
    call deoplete#custom#set('syntax',        'mark', '♯')
    call deoplete#custom#set('tmux-complete', 'mark', '⊶')

    call deoplete#custom#set('vim',           'rank', 620)
    call deoplete#custom#set('jedi',          'rank', 610)
    call deoplete#custom#set('omni',          'rank', 600)
    call deoplete#custom#set('neosnippet',    'rank', 510)
    call deoplete#custom#set('member',        'rank', 500)
    call deoplete#custom#set('file_include',  'rank', 420)
    call deoplete#custom#set('file',          'rank', 410)
    call deoplete#custom#set('tag',           'rank', 400)
    call deoplete#custom#set('around',        'rank', 330)
    call deoplete#custom#set('buffer',        'rank', 320)
    call deoplete#custom#set('dictionary',    'rank', 310)
    call deoplete#custom#set('tmux-complete', 'rank', 300)
    call deoplete#custom#set('syntax',        'rank', 200)

augroup END

augroup neosnippet
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
augroup END

augroup echodoc
	set cmdheight=2
	let g:echodoc_enable_at_startup = 1
augroup END

augroup fzf
    nmap <D-p> :GFiles<cr>
    nmap <D-e> :History<cr>
    nmap <C-p> :Files<cr>
augroup END
