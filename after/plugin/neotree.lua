require("neo-tree").setup({
        close_if_last_window = true, -- Close Neo-tree if it's the last window
        enable_git_status = true,    -- Show git status
        enable_diagnostics = true,   -- Show LSP diagnostics
        filesystem = {
          follow_current_file = true, -- Keep the current file in focus in Neo-tree
          hijack_netrw_behavior = "open_default", -- Hijack default file explorer behavior
        },
      })
vim.api.nvim_set_keymap('n', '<M-1>',':Neotree toggle<CR>', { noremap = true, silent = true })
