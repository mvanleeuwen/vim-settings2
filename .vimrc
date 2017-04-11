" Default settings {{{
set nocompatible
let mapleader = ' '
scriptencoding utf-8  " Force use of utf-8
nnoremap ; :
" }}}

" VIM variables {{{
  " Clear settings array
  let settings = {}
  " Set vim directory
  let settings.rtp = expand('~/.vim')
" }}}

" VIM plug setup {{{
  " Install vim-plug if needed
  if !filereadable(g:settings.rtp . '/autoload/plug.vim')
    execute 'silent !curl -fkLo ' . expand(g:settings.rtp . '/autoload/plug.vim') ' --create-dirs'
    \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
  end

  " Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
  call plug#begin('~/.vim/plugged')

  " Download and install plugins
    " Syntastic
    Plug 'vim-syntastic/syntastic'
    Plug 'myint/syntastic-extras'
    " Puppet
    Plug 'rodjek/vim-puppet'
    " Sensible
    Plug 'tpope/vim-sensible'
    " Colorscheme
    Plug 'mhartington/oceanic-next'
    Plug 'iCyMind/NeoSolarized'
    Plug 'altercation/vim-colors-solarized'
    " plugins-ui {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'yonchu/accelerated-smooth-scroll'
    " }}}
    " plugins-ctrlp {{{
    Plug 'ctrlpvim/ctrlp.vim'
    if has('python') || has('python3')
      Plug 'FelikZ/ctrlp-py-matcher'
    endif
    "Plug 'dbeecham/ctrlp-commandpalette.vim', { 'on': 'CtrlPCommandPalette' }
    "Plug 'mattn/ctrlp-vimpatches', { 'on': 'CtrlPVimPatches' }
    "Plug 'okcompute/vim-ctrlp-session',
    "Plug 'ompugao/ctrlp-history', { 'on': ['CtrlPSearchHistory', 'CtrlPCmdHistory'] }
    "Plug 'pasela/ctrlp-cdnjs', { 'on': 'CtrlPCdnJs' }
    "Plug 'prabirshrestha/ctrlp-env', { 'on': 'CtrlPEnv' }
    "Plug 'kaneshin/ctrlp-filetype', { 'on': 'CtrlPFiletype' }
    "Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
    "Plug 'mattn/httpstatus-vim', { 'on': 'CtrlPHttpStatus' }
    "Plug 'mattn/ctrlp-hackernews', { 'on': 'CtrlPHackerNews' }
    "Plug 'mattn/ctrlp-mark', { 'on': 'CtrlPMark' }
    "Plug 'zeero/vim-ctrlp-help', { 'on': 'CtrlPHelp' }
    "" Plug 'hara/ctrlp-colorscheme', { 'on': 'CtrlPColorscheme' }
    "Plug 'prabirshrestha/ctrlp-colorscheme', { 'on': 'CtrlPColorscheme', 'branch': 'prabirshrestha-patch-1' }
    " }}}

    " plugins-filetypes {{{
    "  Plug 'chrisbra/csv.vim', { 'for': 'csv' }
    Plug 'elzr/vim-json', { 'for': 'json' }
    "  Plug 'tpope/vim-jdaddy', { 'for': 'json' }
    "  Plug 'mattn/emmet-vim'
    "  Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
    "  Plug 'amirh/HTML-AutoCloseTag'
    "}}}
  call plug#end()
" }}}

"" Syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['pyyaml']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_puppet_checkers = ['puppetlint']
" }}}

" VIM settings
set nobackup
set noswapfile
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display current mode
set cursorline                  " Highlight current line
"set cursorcolumn               " Highlight current column

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line height
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list

" Highlight problematic whitespace
set list listchars=tab:>-,trail:.,extends:>
set showbreak=···
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vertical split windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           " paste toggle (sane indentation pastes)
set number
set ruler
" Dotted spaces, tabs and trailing spaces
"set list listchars=tab:\ \ ,trail:.

" Light 80 column ruler for non-intrusive visual guide for format
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
