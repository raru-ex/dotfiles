" 置換時にpreviewが見れる
set inccommand=split
" terminal modeをCtrl-[で止める
tnoremap <silent> <C-[> <C-\><C-n>

" python3がうまく読み込めない場合があるため直接指定する。
" whichのみだと改行が入ったりするためechoで対応
let g:python3_host_prog = system('echo -n $(which python3)')
