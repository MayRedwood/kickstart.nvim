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
              wyfc = '~/Documents/.wyfc',
              -- my_other_notes = '~/work/notes',
            },
            default_workspace = 'notes',
            index = 'index.norg', -- The name of the main (root) .norg file
          },
        },
        ['core.dirman.utils'] = {},
        ['core.journal'] = {
          config = {
            workspace = 'notes',
          },
        },
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        },
        ['core.integrations.nvim-cmp'] = {},
        ['core.integrations.image'] = {},
      },
    }
  end,
}
