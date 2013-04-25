" vimrc, Johannes Hoff
" This file along with the others in the repository should be checked out into
"    $HOME/vimfiles/   on Windows, and
"    $HOME/.vim/       on Linux
" It will be run automatically on vim startup

set nocompatible
set number
set numberwidth=4
set tabstop=4
set shiftwidth=4
syntax on
"language en_gb
set autoindent        " Keep indenting from last line
set copyindent        " ... and keep the indentation characters in tact
set preserveindent    " ... also when changing indentation
set ruler             " Display file position
set linebreak         " Break on word endings
set lbr               " Word wrap on
set display+=lastline " Show the last line even though it flows out of the bottom
let moria_fontface='mixed' " Use bold fonts
colorscheme herald
let mapleader = ","   " Use , as <leader> (default \).
set cursorline        " Highlight the line where the cursor is
set scrolloff=3       " Try to keep three lines visible on top/bottom when scrolling

if has("gui_running")
 "set guifont=ProggyCleanTT:h11
 set lines=77
 set columns=120
 winpos 270 0
endif

autocmd! FileType python                           " Remove all python autocmds
autocmd  FileType python set suffixesadd+=.py       " Make 'gf' work on python import statements
autocmd  FileType python set omnifunc=pythoncomplete#Complete " Omnicomplete with CTRL+x CTRL+o
autocmd! BufWritePost vimrc.vim source %           " Reload vimrc on save
autocmd! BufNewFile,BufRead *.pde   setf arduino   " To get syntax highlighting for Arduino projects
autocmd! BufNewFile,BufRead *.ot    setf selftest  " To get syntax highlighting for Opera selftests
autocmd! BufNewFile,BufRead *.mkd   setf mkd       " To get syntax highlighting for markdown
autocmd! BufRead,BufNewFile *.json  setf json

" Hack to get the path where this file is stored.
" If you are reading this and know a better way, let me know!
let g:_vimrcpath=split(&runtimepath, ',')[0] . "/plugin"

function! Detect_space_or_tab()
	" Autodetect tabs or spaces
	" Fail towards tabs
	if search('^    ', 'n', 100)
		set tabstop=4
		set shiftwidth=4
		set expandtab
	else
		set tabstop=4
		set shiftwidth=4
		set noexpandtab
	end
endfunction

" Make markdown header and subheader with ,1 and ,2
map <silent> <leader>1 yyp:s/./-<CR>
map <silent> <leader>2 yyp:s/./=<CR>

" Add XML header with ,x
map <silent> <leader>x i<?xml version='1.0' encoding='UTF-8'?><ESC>
" Replace word under curser throughout file with ,r
map <leader>r yiwq:a%s/<ESC>pA/<C-c>
" Change between header and source file with ,h (uses FSwitch script)
map <leader>h :FSHere<CR>
" Toggle checking for Typos
noremap <leader>t :set spell!<CR>
" Run current line/selection as Python code and replace with the output
nmap <leader>p :.!python<CR>
vmap <leader>p :!python<CR>
" Open this file with ,v
nmap <leader>v :exe ":e " . g:_vimrcpath . "/vimrc.vim"<CR>


" bookmarks:
"   C-F2   to set
"   ,d     to remove (todo: toggle with C-F2)
"   C-S-F2 to remove all
sign define bookmark text=@@
nmap <silent> <C-F2> :exe ":sign place " . line(".") . " name=bookmark line=" . line(".") . " file=" . expand("%:p")<CR>
nmap <silent> <leader>d :sign unplace<CR>
nmap <silent> <C-S-F2> :sign unplace *<CR>

" Y does the same as yy, so we might as well make it useful
nmap Y y$

" Load foreign scripts
"au Filetype html,xml,xsl source scripts/closetag.vim

" Toggle showing highlighting search results
noremap <F4> :set hlsearch!<CR>
" From http://www.stripey.com/vim/search.html
set incsearch      " Incremental search
set ignorecase     " Ignore case in searches...
set smartcase      " ... except if it contains uppercase letters
set gdefault       " When doing s/foo/bar, automatically use /g (replace on all lines)
set wildmode=longest,list " Do completion like readline

" Syntax
let java_allow_cpp_keywords=1  " Don't give errors on words like delete, since those are present in
                               " standard lib functions. (I can't believe it defaults to showing them!)

" Enough with the swp-bullshit, already
set nobackup
set nowritebackup
set noswapfile

" From http://github.com/h3rald/stash
nmap <F6> :set invcursorcolumn<CR>" Crosshair for cursor (not always on as h3rald)
set laststatus=2 " Always show the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " Nice status line
set showcmd " Show the size of selection in visual mode

" From Abbe
set bs=2

" standard shortcuts
nmap <C-a> ggVG

" kwrite shortcuts
"unmap <F10>
"unmap <F11>
nmap <F10> :set invwrap<CR>
nmap <F11> :set invnumber<CR>
imap <F10> <ESC>:set invwrap<CR>a
imap <F11> <ESC>:set invnumber<CR>a
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a

" Tabs
" Stolen with modifications from http://www.vim.org/tips/tip.php?tip_id=1221
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>a
imap <C-tab> <ESC>:tabnext<cr>a

" Feature specific
" See
"    :help feature-list
" for more infor on features
if has('win32')
	noremap <silent> <C-F5> viW:<C-U>let old_reg=@"<cr>gvy:silent!!cmd /cstart <C-R><C-R>"<CR>:let @"=old_reg<cr>
					" Kjør programmet/urlen/etc under cursoren
	noremap <silent> <leader>b viW:<C-U>let old_reg=@"<cr>gvy:silent!!cmd /cstart https://bugs.opera.com/browse/<C-R><C-R>"<CR>:let @"=old_reg<cr>
					" Åpne buggen under cursoren
	noremap <silent> <F5> :silent!!cmd /cstart %<CR> " Kjør programmet som er lastet i bufferen
	set guifont=Consolas
endif

if has('gui_running')
	set guioptions-=T	" Get rid of toolbar
	set guioptions-=m	" Get rid of menu
endif

if has('unix')
	set guifont=bitstream\ vera\ sans\ mono\ 8
endif

if has('sun_workshop') || has('netbeans_intg') " These are the features which define autochdir
	set autochdir         " Auto chdir to location of the active document
endif

" From http://items.sjbach.com/319/configuring-vim-right
set history=1000							" Longer search and command history
set title									" Set the title of the window for non-gvim sessions
"filetype indent on							" Load indentation rules for the current filetype
set listchars=tab:>-,trail:·,nbsp:§,eol:$	" Use ,s to show whitespace
nmap <silent> <leader>s :set nolist!<CR>
set shortmess=atI							" Suppress 'Press ENTER or type command to continue'
set hidden									" Buffers are hidden instead of closed. Useful for briefly
											" opening new files in the same buffer


" Mnemonics
"   ga		get ascii (of char below pointer)

" Ideas for later
"   Highlight lines: http://vim.sourceforge.net/tips/tip.php?tip_id=769
"   Autosave : <leader>a to toggle. When on swapfile is turned off, and file is saved before any (external)
"              command is run and whenever the window loses focus. Should be great for revision controlled 
"              environments

" Interresting reading
"   Using viewports: http://www.linux.com/articles/54157
"   Using marks: http://www.linux.com/articles/54159

" Tips
"   To copy from history type q:, yank the link you want, and ctrl-c your way out
"   Hex edit of the file ':%!xxd' and to go back ':%!xxr -r'
"   Prettyprint xml ':%!xmllint --format -'
"   To replace spaces with tabs ':retab', or vice versa, depending on expandtab
"      More on tabs/spaces: http://stackoverflow.com/questions/69998/tabs-and-spaces-in-vim
"   Word count: g<C-g>
"   gq: Format with text into columns (default width 80, set by textwidth)

" Maybes from mikael albertsson, https://homes.oslo.opera.com/mikal/vimrc
" map <C-g> :source ~/.vim/cguard.vim<CR>
" map <C-Left> :bp<CR>
" map <C-Right> :bn<CR>
" 
" " A couple of bindings to ease the use of tabs.
" map <S-Left> :tabprevious<CR>
" map <S-Right> :tabnext<CR>
" map <C-n> :tabnew<CR>
