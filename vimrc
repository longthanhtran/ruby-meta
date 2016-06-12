set nocompatible
filetype off

" Vundle {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-ragtag'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'whatyouhide/vim-gotham'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'jiangmiao/auto-pairs'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'altercation/vim-colors-solarized'
Plugin 'elixir-lang/vim-elixir'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'szw/vim-tags'
Plugin 'tpope/vim-endwise'
" Plugin 'garbas/vim-snipmate'
" JSX - ReactJS support
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
Plugin 'tpope/vim-cucumber'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-haml'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on

" }}}

" Vim-Airline settings {{{
let g:airline_powerline_fonts               = 1
let g:airline_theme                         = 'powerlineish'
let g:airline#extentions#branch#enabled     = 1
let g:airline#extensions#synstastic#enabled = 1
" }}}
"
let g:airline_powerline_fonts = 1
let mapleader = ","
syntax enable
colorscheme solarized
set background=dark

let vim_tags_auto_generate = 1

" Surround mappings for django {{{
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
" }}}

" Mappings {{{

" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object
nmap ga <Plug>(EasyAlign)

" Insert mode mappings {{{
inoremap <C-l> <space>=><space>
inoremap <C-s> <Esc>:w<CR>a
" }}}

" Normal mode mappings {{{
nnoremap <C-s> :w<CR>
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>gs :Gstatus<CR><C-W>15+
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>rs :!clear;time bundle exec rake<CR>
nnoremap <leader>a :Ack
nnoremap <leader>d :bd<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><cr> :noh<CR>
nnoremap <leader>l :ls<CR>:b
nnoremap <leader>t :CtrlP<CR>
nnoremap n nzz
nnoremap N Nzz
" }}}

" Visual mode mappings {{{
vnoremap < <gv
vnoremap > >gv

" Execute dot in the selection
vnoremap . :norm.<CR>
" }}}

" }}}

" General settings {{{
set t_Co=256
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
if has('gui_running')
  set guifont=Fira\ Mono\ Medium\ for\ Powerline:h12
endif
" set guifont=Fira\ Mono\ 13
set guioptions-=Be
set guioptions=aAc
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set noswapfile
set number
set shell=/bin/bash
set showmatch
set smartcase
set smartindent
" set term=screen-256color
" set ts=2 sts=2 sw=2 expandtab
set novisualbell
set winheight=999
set winheight=5
set winminheight=5
set winwidth=84

autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab|set fdm=syntax
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab

" Use babel/jsx syntax
let g:jsx_ext_required = 0
" }}}

" Autocommands {{{

".ru files are Ruby.
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile [vV]agrantfile set filetype=ruby

" Markdown gets auto textwidth
au Bufread,BufNewFile *.md set filetype=markdown textwidth=79
au Bufread,BufNewFile *.markdown set textwidth=79

" .feature files are Cucumber.
au Bufread,BufNewFile *.feature set filetype=cucumber

" Ruby Minitest auto complete
set completefunc=syntaxcomplete#Complete
" }}}

" Statusline {{{
hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]
set statusline+=%<pwd:%{getcwd()}\
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\

set laststatus=2

" }}}

" Specific configurations {{{
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
" }}}
"
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

" {{{ Autocomplete function
function! InsertTabWrapper()
  let col = col(".") - 1
  if !col || getline(".")[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>
" }}}

" vim: foldmethod=marker foldmarker={{{,}}}
