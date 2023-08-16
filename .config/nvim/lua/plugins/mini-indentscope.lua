local ok, indent = pcall(require, 'mini.indentscope')

if ok then
  

  indent.setup({
    symbol = "│",
    options = { 
      try_as_border = true
    },
    draw = {
      delay = 200,
      animation = indent.gen_animation.none(),
    },
  })
end
