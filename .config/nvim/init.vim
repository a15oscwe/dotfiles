
"
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"
"------------------------------------------------------------
" => Plugins
"{{{
set nocompatible              " be iMproved, required
" set the runtime path to include vim-plug and initialize

" auto-install vim-plug                                                                                                                
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))                                                                                    
  silent ! curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall                                                                                                      
endif

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'tpope/vim-fugitive'
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plug 'ascenator/L9', {'name': 'newL9'}
" Editor
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'sjl/vitality.vim'
Plug 'gcmt/taboo.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'rizzatti/dash.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'Chiel92/vim-autoformat'
Plug 'jonathanfilip/vim-lucius'

" From another .vimrc
Plug 'beloglazov/vim-online-thesaurus'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/csapprox',        { 'for': 'fugitiveblame'            }
Plug 'junegunn/vader.vim',
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'xolox/vim-misc',          { 'for': 'lua'        }

" Git
Plug 'airblade/vim-gitgutter'
" Indent
Plug 'nathanaelkane/vim-indent-guides'
" Vim themes
Plug 'chriskempson/base16-vim'

"------------------------------------------------------------
" My own configs
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'
Plug 'w0rp/ale'

" All of your Plugins must be added before the following line
call plug#end()            " required
"}}}
" => Configs "
"{{{

" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

"" Config for theme and lightline
" Enable syntax highlighting
syntax on

set background=dark

" Colorscheme management
let g:gruvbox_contrast_dark='neutral'
"let base16colorspace=256

let g:gruvbox_invert_selection=0

if system('uname') =~ "Darwin"
  silent! colorscheme gray2
else
  "silent! colorscheme blaquemagick
  silent! colorscheme sourcerer
endif


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{ALEGetStatusLine()}

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:tmuxline_powerline_separators = 1

let g:lightline = {
      \'colorscheme': 'wombat',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \}
"}}}
" => Must have options
"{{{
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

language en_GB.UTF-8

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

set foldmethod=marker
"}}}
" => Usability options
"{{{
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

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

set nobackup
set nowb
set noswapfile
" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display absolute or relative number to the left
set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
"}}}
" => Indentation options
"{{{
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
"}}}
" => Vim variables
"{{{
set encoding=utf-8 " set the encoding to utf-8
set t_Co=256 " set terminal color 265
set clipboard=unnamed " fix not copying between clipboard and vim
set backspace=indent,eol,start " fix backspace not deleteing existing text
"set number " set numbers column on the left
set complete-=i " Faster vim completion
set nrformats-=octal " Increment numbers decimally using Ctrl+A and Ctrl+X
set autoindent " Auto indent
set smartindent "Smart indet
set smarttab
set softtabstop=2 " indentation
set tabstop=2 " indentation
set shiftwidth=2 " indentation
set expandtab " convert tabs to spaces
"set ttyscroll=3 " speed up scrolling
set ttyfast " Optimize for fast terminal connections
set lazyredraw " to avoid scrolling problems
"set ttimeout " less timeout for faster navigation
"set ttimeoutlen=100 " time out for faster navigation
set incsearch " Make search act like search in modern browsers
set ignorecase " Ignore case when searching shortend ic
" set noignorecase " Case Senetive searching shortend noic
set smartcase " case-sensitive search if any caps
set hlsearch " Highlight search things shortend hls or nohls
set laststatus=2 " Always show the status line
set ruler " Always show current position
set showcmd " display incomplete commands
set wildmenu " Turn on Wild menu
set wildignore=*.o,*~,*.pyc " Ignore compiled files
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set undofile " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=200 " How many undos
set undoreload=200 " number of lines to save for undo
set fileformats+=mac " correct mac file format
set tabpagemax=50 " Set the maximum number of tabs allowed
set modelines=0 " disable the modelines which i don't understand
set nomodeline " disable the modelines which i don't understand
set lbr " Vim to wrap existing text as desired
set nowrap " let Vim Wrap lines or leave them as long as they get
set noeb vb t_vb=
" set cursorline " highlight current line
" set nocursorline " don't highlight current line
set splitbelow " position the preview window below current windows
set mouse=a "enable mouse movements, default set mouse=
set tags=.tags
set linespace=0

" set vim startup faster
if !empty(&viminfo)
  set viminfo^=!
endif
"}}}
" => Mappings
" {{{
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
:imap jk <Esc>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"}}}
