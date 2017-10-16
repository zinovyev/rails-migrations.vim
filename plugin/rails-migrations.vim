" rails-migrations.vim - List Rails migrations and data migrations
" Author: Zinovyev Ivan <https://github.com/zinovyev>
" Description: List and select Rails migrations and data migrations in quickfix
" window
" Version: 0.1

function! RListMigrations(path)
  let mig_tmp = tempname()
  let mig_cmd = 'for f in `find ' . a:path . ' -type f -name "*rb" | sort -Vr`; do fline=`head -n1 $f`; echo "$f:0:$fline"; done'
  call system(mig_cmd . ' > ' . mig_tmp)
  execute "silent! cgetfile " . mig_tmp
  botright copen
  call delete(mig_tmp)
endfunction

" List Rails migrations
function! RMigrations()
  let path = 'db/migrate'
  call RListMigrations(path)
endfunction
command! RMigrations call RMigrations()
command! Rmigrations call RMigrations()

" List Rails data migrations
function! RData()
  let path = 'db/data'
  call RListMigrations(path)
endfunction
command! RData call RData()
command! Rdata call RData()
