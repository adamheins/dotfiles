" Plugins {{{1
"
" Pathogen plugin manager.
execute pathogen#infect()

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" Neocomplete tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "<TAB>"

" NERDTree
let NERDTreeQuitOnOpen = 1

" Use .. to move up a dir in NERDTree.
let NERDTreeMapUpdir = '..'

" Update gitgutter in realtime.
let g:gitgutter_realtime = 1

call gitgutter#disable()

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Get 256 colors with gnome.
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set nohlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters.
" Also search incrementally (jump to top match as you type)
set ignorecase
set smartcase
set incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Hide the mode status messages, since neatstatus shows the mode.
set noshowmode

" The vim C syntax highlighter has a grudge against compound struct literals.
" Make it stop.
let c_no_curly_error=1

" Get rid of the preview scratch window.
set completeopt-=preview

" Reduce updatetime to something more reasonable. Makes gitgutter more usable.
set updatetime=750

"------------------------------------------------------------
" Indentation options {{{1

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set tabstop=2
set expandtab

"------------------------------------------------------------
" Mappings {{{1

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map h,k to include wrapped lines.
" This makes editing files with very long lines much more pleasant.
noremap j gj
noremap k gk

" Disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Insert blank lines without entering insert mode.
nnoremap gj o<Esc>
nnoremap gk O<Esc>

" Avoid accidentally triggering J/K behaviour when navigating.
nnoremap gJ J
nnoremap gK K

" Move up/down regardless of case.
nnoremap J j
nnoremap K k

" Make switching between splits easier.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More useful window mappings.
nnoremap ,<C-J> :split<CR><C-W><C-J>
nnoremap ,<C-K> :split<CR>
nnoremap ,<C-H> :vsplit<CR>
nnoremap ,<C-L> :vsplit<CR><C-W><C-L>
nnoremap ,, :bNext<CR>
nnoremap ,m :enew<CR>

" CtrlP buffer search.
noremap ,b :CtrlPBuffer<CR>

" Toggle NERDTree.
noremap ,n :NERDTreeFind<CR>

" Make interaction with the system clipboard easier.
noremap "" "+p
vnoremap "' "+y

"------------------------------------------------------------
" Commands {{{1

" Sometimes I still have shift pressed when I type these.
command! Q q
command! W w

"------------------------------------------------------------
" Colours {{{1
"
" Colour and highlighting options.

" Enable syntax highlighting and set the color scheme
syntax on
colorscheme lucid

" Highlight the current line.
set cursorline

" Highlight line 100.
" let &colorcolumn=100

autocmd BufEnter * highlight OverLength ctermbg=236
autocmd BufEnter * match OverLength /\%100v.*/
