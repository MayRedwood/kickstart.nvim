return {
  'nvim-neorg/neorg',
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  -- ft = 'norg',
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
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/notes', -- Format: <name_of_workspace> = <path_to_workspace_root>
              -- my_other_notes = '~/work/notes',
            },
            index = 'index.norg', -- The name of the main (root) .norg file
          },
        },
        ['core.journal'] = {
          config = {
            workspace = 'notes',
          },
        },
      },
    }
  end,
}
