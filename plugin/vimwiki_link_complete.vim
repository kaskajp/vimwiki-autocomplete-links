" vimwiki-autocomplete-links - Autocomplete [[links]] in Vimwiki
" Maintainer: Your Name
" License: MIT

" Prevent loading twice
if exists('g:loaded_vimwiki_link_complete')
  finish
endif
let g:loaded_vimwiki_link_complete = 1

" Save compatibility options
let s:save_cpo = &cpo
set cpo&vim

" Configuration options
" g:vimwiki_link_complete_popup_arrows - Enable arrow keys in popup (default: 1)
if !exists('g:vimwiki_link_complete_popup_arrows')
  let g:vimwiki_link_complete_popup_arrows = 1
endif

" Autocomplete links in Vimwiki ([[go..)
" Press Ctrl-Space to open autocomplete menu, use arrow up/down
" to choose and press Enter. Enter appends ]] to complete the link.
augroup VimwikiLinkCompletion
  autocmd!
  " Use our custom completion function in vimwiki buffers
  autocmd FileType vimwiki setlocal completefunc=vimwiki_link_complete#complete
  " Popup menu behavior
  autocmd FileType vimwiki setlocal completeopt=menuone
  " Ctrl-Space triggers vimwiki completion
  autocmd FileType vimwiki inoremap <buffer> <C-Space> <C-x><C-u>
  " When popup is visible:
  "   <CR> = accept current item + append ]]
  " When popup is not visible:
  "   <CR> = normal newline
  autocmd FileType vimwiki inoremap <expr><buffer> <CR> pumvisible()
        \ ? "\<C-y>]]"
        \ : "\<CR>"
augroup END

" When popup menu is visible, make <Down>/<Up> behave like <C-n>/<C-p>
" Only set if enabled (default: on)
if g:vimwiki_link_complete_popup_arrows
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
endif

" Restore compatibility options
let &cpo = s:save_cpo
unlet s:save_cpo

