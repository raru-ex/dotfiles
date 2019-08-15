"---------- terminal settings ----------"
nnoremap <C-t><C-t> :bo term ++rows=30<CR>
nnoremap vtm :<C-u>vert term ++close 
nnoremap lg :<C-u>vert term ++close lazygit<CR>

"---------- scala fmt ----------"
noremap <Space>gf :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']
