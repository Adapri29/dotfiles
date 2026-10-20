vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
  on_attach = function(buf)
    local gs = require("gitsigns")
    local function map(keys, fn, desc)
      vim.keymap.set("n", keys, fn, {buffer = buf, desc = desc})
    end

    map("]h", function() gs.nav_hunk("next") end, "Siguiente cambio")
    map("[h", function() gs.nav_hunk("prev") end, "Cambio anterior")
    map("<leader>gp", gs.preview_hunk, "Ver el cambio")
    map("<leader>gr", gs.reset_hunk, "Deshacer el cambio")
    map("<leader>gs", gs.stage_hunk, "Preparar el cambio (git add)")
    map("<leader>gb", gs.blame_line, "Quién cambió esta línea")
    map("<leader>gd", gs.diffthis, "Comparar archivo con el último commit")
  end,
})


