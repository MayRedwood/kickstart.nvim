return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  config = function()
    require('noice').setup {
      -- add any options here
      -- cmdline = {
      --   view = 'cmdline',
      -- },
      lsp = {
        progress = {
          enable = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = 'lsp',
            kind = 'progress',
            cond = function(message)
              -- local client = vim.tbl_get(message.opts, 'progress', 'client')
              -- return client == 'lua_ls'
              return true
            end,
          },
          opts = { skip = true },
        },
      },
    }
    vim.keymap.set('n', ',,', '<cmd>Noice dismiss<cr>', { desc = 'Dismiss notifications' })
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
}
