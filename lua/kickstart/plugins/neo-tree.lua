-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '|', ':Neotree toggle buffers action=show<CR>', desc = 'Show buffers sidebar', silent = true },
  },
  opts = {
    use_default_mappings = false,
    enable_git_status = false,
    enable_diagnostics = false,
    close_if_last_window = true,
    -- filesystem = {
    --   window = {
    --     mappings = {
    --       ['|'] = 'close_window',
    --     },
    --   },
    -- },
  },
}
