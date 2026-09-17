
-- AUTOSAVE --
vim.api.nvim_create_autocmd({'InsertLeave', "TextChanged", "FocusLost"}, {
  callback = function()
    if vim.bo.modified and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})



