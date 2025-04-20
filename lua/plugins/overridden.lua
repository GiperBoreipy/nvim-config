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
}}
