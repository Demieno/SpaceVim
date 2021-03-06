let s:self = {}


if exists('*getcmdwintype')
  function! s:self.is_cmdwin() abort
    return getcmdwintype() !=# ''
  endfunction
else
  function! s:self.is_cmdwin() abort
    return bufname('%') ==# '[Command Line]'
  endfunction
endif

function! s:self.open(opts) abort
    let buf = get(a:opts, 'bufname', '')
    let mode = get(a:opts, 'mode', 'vertical topleft split')
    let cmd = get(a:opts, 'cmd', '')
    if empty(buf)
        exe mode bufopt
    else
        exe mode buf
    endif
    exe cmd
endfunction


func! s:self.resize(size, ...) abort
	let cmd = get(a:000, 0, 'vertical')
	exe cmd 'resize' a:size
endf

fu! SpaceVim#api#vim#buffer#get()
   return deepcopy(s:self)
endf
