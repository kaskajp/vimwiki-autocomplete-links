" vimwiki-autocomplete-links - Autoload functions
" Maintainer: Your Name
" License: MIT

" Completion function for vimwiki links
" Usage: Set as completefunc and trigger with <C-x><C-u>
function! vimwiki_link_complete#complete(findstart, base) abort
  " 1) Find where completion starts
  if a:findstart
    let line = getline('.')
    let col = col('.') - 1
    " Walk backwards to find [[
    while col > 1
      if line[col - 1] ==# '[' && line[col - 2] ==# '['
        " Completion starts right after [[
        return col
      endif
      let col -= 1
    endwhile
    return -1
  endif

  " 2) Build completion list
  let l:base = a:base
  let l:wiki = get(g:, 'vimwiki_list', [{}])
  let l:wiki_config = get(l:wiki, 0, {})
  let l:root = expand(get(l:wiki_config, 'path', '~/vimwiki/'))
  let l:ext = get(l:wiki_config, 'ext', '.wiki')

  " Find all wiki files
  let l:files = split(globpath(l:root, '**/*' . l:ext), '\n')
  let l:results = []

  for l:f in l:files
    " Use filename without extension, e.g. note.md -> note
    let l:name = fnamemodify(l:f, ':t:r')
    " Only include names that start with what you've typed
    if l:name =~? '^' . escape(l:base, '.*$^~\')
      call add(l:results, l:name)
    endif
  endfor

  return l:results
endfunction

