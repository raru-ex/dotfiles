local ok, neotest = pcall(require, 'neotest')
local ok_go, neotest_go = pcall(require, 'neotest-go')

if ok and ok_go then 

  -- unit
  vim.keymap.set('n', '<Leader>tn', function() 
    neotest.run.run()
    neotest.summary.open()
  end, { noremap = true, silent = true })

  -- file
  vim.keymap.set('n', '<Leader>tf', function()
    neotest.run.run(vim.fn.expand("%"))
    neotest.summary.open()
  end, { noremap = true, silent = true })

  -- package
  vim.keymap.set('n', '<Leader>tp', function()
    neotest.run.run(vim.fn.expand("%:h"))
    neotest.summary.open()
  end, { noremap = true, silent = true })

  -- close
  vim.keymap.set('n', '<Leader>tc', function()
    neotest.output_panel.close()
    neotest.summary.close()
  end, { noremap = true, silent = true })

  -- quit test
  vim.keymap.set('n', '<Leader>tq', function()
    neotest.run.stop()
  end, { noremap = true, silent = true })

  -- get neotest namespace (api call creates or returns namespace)
  local neotest_ns = vim.api.nvim_create_namespace("neotest")
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local message =
        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        return message
      end,
    },
  }, neotest_ns)
  neotest.setup({
    -- your neotest config here
    adapters = {
      neotest_go({
        experimental = {
          test_table = true,
        },
        args = { "-count=1" }
      }),
    },
  })

end
