#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

cat >"$HOME/.ideavimrc" <<'EOF'
let mapleader = " "

set number
set relativenumber

set guicursor=

nmap ya ggyG
inoremap <C-c> <Esc>
nnoremap <C-f> <Esc>
vnoremap <C-f> <Esc>
inoremap <C-f> <Esc>
nnoremap Q <Nop>

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

nnoremap <C-p> :action SearchEverywhere<CR>

nnoremap <leader>s :action Replace<CR>

nnoremap <leader>f :action ReformatCode<CR>
nnoremap <leader>i :action OptimizeImports<CR>

nnoremap gd :action GotoDeclaration<CR>
nnoremap K :action QuickJavaDoc<CR>
nnoremap <leader>ws :action GotoSymbol<CR>
nnoremap <leader>rr :action FindUsages<CR>
nnoremap <leader>rn :action RenameElement<CR>
nnoremap <C-h> :action ParameterInfo<CR>

nnoremap <leader>n :action NextTab<CR>
nnoremap <leader>p :action PreviousTab<CR>
nnoremap <C-^> :action RecentFiles<CR>
EOF

cat >"$HOME/.editorconfig" <<'EOF'
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 4
max_line_length = 120
EOF

cat >"$HOME/.editorconfig-yaml" <<'EOF'
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 4
max_line_length = 120

[*.yml]
indent_size = 2

[*.yaml]
indent_size = 2
EOF
