" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
"-----------------------------------------
call plug#begin()
    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction
    Plug 'arcticicestudio/nord-vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'zchee/deoplete-jedi'
    Plug 'w0rp/ale'
    "Plug 'neomake/neomake', { 'on': 'Neomake' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'machakann/vim-sandwich'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Javascript Plugins
    Plug 'pangloss/vim-javascript'
    Plug 'carlitux/deoplete-ternjs'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
    " Python Plugins
    Plug 'tell-k/vim-autopep8'
    Plug 'fisadev/vim-isort'
call plug#end()
set updatetime=500
"----------------------------------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ 'ignore_case': v:true,
    \ 'camel_case': v:true,
    \ })
let g:tern#command = ['tern']
let g:tern#arguments = [' — persistent']
"----------------------------------------"
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
" let g:neomake_list_height = 2
" let g:neomake_open_list = 2
" let g:neomake_verbose = 3
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:gutentags_add_default_project_roots = 0
" let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
" let g:gutentags_cache_dir = expand('~/.gutentags_cache')
" let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0
" let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
" let g:gutentags_ctags_exclude = [
" \  '*.git', '*.svn', '*.hg',
" \  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
" \  '*-lock.json',  '*.lock',
" \  '*.min.*',
" \  '*.bak',
" \  '*.zip',
" \  '*.pyc',
" \  '*.class',
" \  '*.sln',
" \  '*.csproj', '*.csproj.user',
" \  '*.tmp',
" \  '*.cache',
" \  '*.vscode',
" \  '*.pdb',
" \  '*.exe', '*.dll', '*.bin',
" \  '*.mp3', '*.ogg', '*.flac',
" \  '*.swp', '*.swo',
" \  '.DS_Store', '*.plist',
" \  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
" \  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
" \  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
" \]
"----------------------------------------
autocmd! BufWritePost *.js silent! Neomake
let g:neomake_warning_sign = {
    \ 'text': '?',
    \ 'texthl': 'Warning',
    \ }
let g:neomake_error_sign = {
    \ 'text': 'X',
    \ 'texthl': 'Error',
    \ }
"----------------------------------------
syntax on
filetype plugin indent on
colorscheme nord
set termguicolors
set mouse=a
set number relativenumber
set numberwidth=1
set ruler
set visualbell
set encoding=utf-8
set wrap
set textwidth=79
set shiftwidth=2
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set expandtab
set noshiftround
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set laststatus=2
set statusline+=%F
let g:move_key_modifier = 'S'
let g:nord_cursor_line_number_background=1
let g:nord_uniform_status_lines=1
let g:nord_bold_vertical_split_line=1
let g:nord_uniform_diff_background=1
let g:nord_italic_comments=1
let g:nord_underline=1
" Jedi-vim configuration
let g:jedi#show_call_signatures = 1 
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview
" A bit of autopep8 config
let g:autopep8_disable_show_diff=1
" ap for a quick .py file formatting
nnoremap ap :Autopep8<CR>
" \e to open a NerdTree at in the directory of the currently viewed file
nnoremap <Leader>e :Ex<CR>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent><esc> :noh<return><esc>
