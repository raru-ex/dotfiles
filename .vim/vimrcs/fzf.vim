" 参考
" https://www.wazalab.com/2018/09/23/2018%E5%B9%B4%E3%81%AEvim%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E6%A4%9C%E7%B4%A2%E3%83%BB%E6%96%87%E5%AD%97%E5%88%97%E6%A4%9C%E7%B4%A2%E3%81%AFfzf%E3%81%A8ripgreprg%E3%81%A7%E6%B1%BA%E3%81%BE/
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \ <bang>0)

nnoremap <C-g> :Rg<Space>
nnoremap <C-p> :Files<CR>
