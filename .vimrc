"
" Copyright (c) 2011 by Adam Leventhal.
"

" Some old version
version 4.6

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

" Wrap automatically at 80 characters
set textwidth=80

" Show matching (), {}, [] pairs
set showmatch

" Emacs-like auto-indent for C (only indent when I hit tab in column 0)
set cinkeys=0{,0},:,0#,!0<Tab>,!^F

" Keep return types <t> and parameters <p> in K&R-style C at the left edge <0>
" Indent continuation lines and lines with unclosed parens 4 spaces <+4,(4>
set cinoptions=p0,t0,+4,(4

" Activate C indenting and comment formatting when editing C or C++
autocmd BufEnter *.cc,*.c,*.h set fo=croq cindent comments=sr:/*,mb:*,el:*/
autocmd BufLeave *.cc,*.c,*.h set fo=tcql nocindent comments&

" Activate C comment formatting only when editing assembly
autocmd BufEnter *.il,*.s set fo=croq comments=sr:/*,mb:*,el:*/
autocmd BufLeave *.il,*.s set fo=tcql comments&

" De-activate line wrapping when editing Makefiles
autocmd BufEnter Makefile,makefile set textwidth=0
autocmd BufLeave Makefile,makefile set textwidth=80

" Activate our skeleton generator whenever we open a new source file
autocmd BufNewFile Makefile,makefile,Makefile.*,llib-l*,*.cc,*.c,*.h,*.il,*.s,*.pl,*.sh,*.ksh 1,$!/Users/ahl/bin/skel <afile>

" Buffer list shortcuts
nmap [b :buffers<C-m>:buffer
nmap [d :buffers<C-m>:bdelete

" Abbreviate wq to w so I don't accidentally quit (bad habit from vi)
" abbr wq w
