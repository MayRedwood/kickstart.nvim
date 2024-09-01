return {
  'nvim-neorg/neorg',
  -- lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  ft = 'norg',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.keybinds'] = {
          config = {
            default_keybinds = false,
          },
        },
        ['core.concealer'] = {},
      },
    }
  end,
}
