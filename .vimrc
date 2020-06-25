set runtimepath+=~/.vim_runtime
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'matze/vim-move'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
call plug#end()
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
let g:jsx_ext_required = 0
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none'
nnoremap <leader>af :ALEFix<cr>
"Move between linting errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
set mouse=a
syntax on
set number
set relativenumber
set numberwidth=1
set incsearch
set nohlsearch
set smartcase
set ruler
set showcmd
set cursorline
set lazyredraw
set showmatch
set statusline+=%F
let g:move_key_modifier = 'S'
let g:nord_cursor_line_number_background=1
let g:nord_uniform_status_lines=1
let g:nord_bold_vertical_split_line=1
let g:nord_uniform_diff_background=1
let g:nord_italic_comments=1
let g:nord_underline=1
colorscheme nord
try
map <F2> :NERDTreeToggle<CR>
" let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
" Open files in horizontal split
nmap <C-N> :nohlsearch
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>
" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>
source ~/.vim_runtime/my_configs.vim
catch
endtry
