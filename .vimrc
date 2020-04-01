"
" Copyright (c) 2011, 2016 Adam H. Leventhal
"

" Write on buffer switch, write backup files to *.org files
set autowrite backup backupext=.org

" Keep 50 commands in the history
set history=50

" Always show the status line with ruler.  Don't show the mode name.
set laststatus=2 ruler noshowmode

" Treat . [ * special in patterns
set magic

" Do not interpret modeline directives in files we open (more secure)
set nomodeline

" Wrap automatically at 78 characters (80 less a couple of characters)
set textwidth=78
autocmd FileType go setlocal textwidth=130

" Show matching (), {}, [] pairs
set showmatch

" Emacs-like auto-indent for C (only indent when I hit tab in column 0)
set cinkeys=0{,0},:,0#,!0<Tab>,!^F

" Keep return types <t> and parameters <p> in K&R-style C at the left edge <0>
" Indent continuation lines and lines with unclosed parens 4 spaces <+4,(4>
set cinoptions=p0,t0,+4,(4

" Activate C indenting and comment formatting when editing C or C++
"autocmd BufEnter *.cc,*.c,*.h set fo=croq cindent comments=sr:/*,mb:*,el:*/
"autocmd BufLeave *.cc,*.c,*.h set fo=tcql nocindent comments&

" Activate C comment formatting only when editing assembly
"autocmd BufEnter *.il,*.s set fo=croq comments=sr:/*,mb:*,el:*/
"autocmd BufLeave *.il,*.s set fo=tcql comments&

" De-activate line wrapping when editing Makefiles
"autocmd BufEnter Makefile,makefile set textwidth=0
"autocmd BufLeave Makefile,makefile set textwidth=80

" Activate our skeleton generator whenever we open a new source file
"autocmd BufNewFile Makefile,makefile,Makefile.*,llib-l*,*.cc,*.c,*.h,*.il,*.s,*.pl,*.sh,*.ksh,*.java 1,$!~/bin/skel <afile>

" Buffer list shortcuts
"nmap [b :buffers<C-m>:buffer
"nmap [d :buffers<C-m>:bdelete

" autocmd BufNewFile,BufRead *.d setf dtrace

" For me .sh means bash
let g:is_bash=1

syntax on
colorscheme blues

" Use pathogen as our plugin manager
execute pathogen#infect()

" generate help for all modules
Helptags

filetype plugin indent on

" toggle the tagbar
nmap , :TagbarToggle<CR>

" use the menu for completions, not the window
set completeopt-=preview

" use goimports instead of gofmt (superset but slower)
" let g:go_fmt_command = "goimports"

" attempt at smart wrap
set breakindent
set breakindentopt=shift:4
set linebreak

autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype java setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 ignorecase smartcase
autocmd Filetype markdown setlocal textwidth=80

autocmd Filetype tf setlocal expandtab tabstop=2

let g:javascript_plugin_flow = 1

" use JSX syntax hilighting by default.
let g:jsx_ext_required = 0

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" rust.vim
let g:rustfmt_autosave = 1

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
