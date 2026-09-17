return {
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    cmd = "ZenMode",   -- solo carga si lo invocas
    opts = { window = { width = 80 } },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    opts = {
      heading = {
        -- sin fondo de linea completa: solo icono + color de letra
        backgrounds = {},
      },
    },
  },
  {
    "gaoDean/autolist.nvim",
    ft = { "markdown", "text" },
    config = true,
  },
}
