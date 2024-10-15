return {
  "Djancyp/better-comments.nvim",

  config = function()
    require('better-comment').Setup({
      tags = {
          {
              name = "TODO",
              fg = "white",
              bg = "",
              bold = true,
              virtual_text = "",
          },
          {
              name = "FIX",
              fg = "yellow",
              bg = "",
              bold = true,
              virtual_text = "",
          },
          {
              name = "WARNING",
              fg = "#FFA500",
              bg = "",
              bold = false,
              virtual_text = "",
          },
          {
              name = "!",
              fg = "#f44747",
              bg = "",
              bold = true,
              virtual_text = "",
          }
      }
    })
  end,
}
