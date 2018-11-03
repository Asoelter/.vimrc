set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'luochen1990/rainbow'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tikhomirov/vim-glsl'

let g:rainbow_active = 1
hi CursorLine ctermbg=yellow guibg=yellow
hi CursorColumn ctermbg=yellow guibg=yellow

call vundle#end()

nnoremap F :FZF<CR>
nnoremap B :Buffers<CR>
"Miscelanious
:set nu
map ; :set cursorline<CR>:set cursorcolumn<CR>:sleep 100m<CR>:set nocursorline<CR>:set nocursorcolumn<CR>
map<F5> :call CurtineIncSw()<CR>
inoremap jk <ESC>
nnoremap <c-t> :tab split<CR>
nnoremap j gj
nnoremap k gk
nmap / /\c
:set shiftwidth=4 softtabstop=4 "expandtab
command W w
command Q q
command Wq wq
command WQ wq
colorscheme 256-grayvim  

"Not in my personal .vimrc
syntax enable
filetype indent on
set showcmd
set autoindent
set wildmenu 
set lazyredraw
set listchars=tab:▸\ ,trail:·
set showmatch
set noswapfile
set noshowmode
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
"set expandtab

"Octol Personalizations
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"Indent-Guides Personalizations
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guies_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndenGuidesEven guibg=lighgrey ctermbg=4

augroup vimrc_autocmd
    autocmd!
    autocmd SwapExists * :let v:swapchoice = 'e'

    " Resize splits when the window is resized
    au VimResized * exe "normal! \<c-w>="
     " Return to last edit position when opening files (You want this!)
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                 \ |   exe "normal! g`\""
                 \ | endif
    " Add preview functionality to fzf
    au VimEnter * command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    au VimEnter * command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                \     <bang>0 ? fzf#vim#with_preview('up:60%')
                \             : fzf#vim#with_preview('right:50%'),
                \     <bang>0)

augroup END

"glsl setup
"autocmd! BufNewFile,BufRead *.shader set ft=glsl

