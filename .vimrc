execute pathogen#infect()
syntax on
"set nu
"The following line activates line numbers and relative line numbers
set number relativenumber

"The following automatically toggles relative line numbers when entering and
"exiting insert mode
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

filetype plugin indent on
filetype plugin on
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"The following three lines will cause a tab to be 4 spaces long and be actual
"spaces, not a tab
set tabstop=8
set softtabstop=0 noexpandtab
set shiftwidth=8
