return {
  'nvim-lualine/lualine.nvim',
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  dependencies = {
    -- This will give us nice breadcrumbs for editing with LSP on!
    {
      'SmiteshP/nvim-navic',
      dependencies = { 'neovim/nvim-lspconfig' },
      opts = {
        lsp = {
          auto_attach = true,
        },
      },
    },
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        function()
          return vim.fn.getcwd()
        end,
      },
      lualine_x = {
        -- {
        --   require('noice').api.status.message.get_hl,
        --   cond = require('noice').api.status.message.has,
        -- },
        {
          require('noice').api.status.command.get,
          cond = require('noice').api.status.command.has,
          -- color = { fg = '#ff9e64' },
        },
        {
          require('noice').api.status.mode.get,
          cond = require('noice').api.status.mode.has,
          -- color = { fg = '#ff9e64' },
        },
        {
          require('noice').api.status.search.get,
          cond = require('noice').api.status.search.has,
          -- color = { fg = '#ff9e64' },
        },
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {
      lualine_a = {
        function()
          return require('molten.status').kernels()
        end,
      },
      lualine_b = {
        function()
          local venv = os.getenv 'VIRTUAL_ENV'
          local fhs = os.getenv 'FHS'
          local t = {}
          if venv ~= nil then
            t[#t + 1] = 'venv'
          end
          if fhs ~= nil then
            t[#t + 1] = 'fhs'
          end
          return table.concat(t, '/')
        end,
      },
      lualine_c = {
        {
          'navic',
          color_correction = 'dynamic',
          -- navic_opts = { highlight = true },
        },
      },
      lualine_y = { 'windows' },
      lualine_z = { 'tabs' },
    },
    -- winbar = {
    --   lualine_c = {
    --     {
    --       function()
    --         local navic = require 'nvim-navic'
    --         return '> ' .. navic.get_location()
    --       end,
    --       cond = function()
    --         return require('nvim-navic').is_available()
    --       end,
    --     },
    --   },
    -- },
    inactive_winbar = {},
    extensions = { 'lazy', 'trouble' },
  },
}
