return {{
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {

        always_show = {
          ".gitignore", ".dockerignore", "log.log", "test.log", ".github"
        },
        always_show_by_pattern = {
          "*.env"
        },
        hide_by_name = {
          "__pycache__"
        }
      }
    }
  }
}, 
  {
  "hrsh7th/nvim-cmp",
  opts = function (_, opts)
    cmp = require("cmp")
    opts.sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.kind,
          cmp.config.compare.scopes,
          cmp.config.compare.sort_text,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
    return opts
  end
}

}
