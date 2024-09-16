return {
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    init = function()
      -- these are examples, not defaults. Please see the readme
      -- vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 30
      vim.g.molten_auto_image_popup = true
      vim.g.molten_auto_open_output = false
      vim.g.molten_virt_text_output = true
      vim.g.molten_enter_output_behavior = 'open_and_enter'
      vim.keymap.set('n', '<leader>mik', '<cmd>MoltenInit<CR>', { desc = 'Initialize a kernel' })
      vim.keymap.set('n', '<leader>mid', '<cmd>MoltenDeinit<CR>', { desc = 'Deactivate a kernel' })
      vim.keymap.set('n', '<leader>mii', '<cmd>MoltenInfo<CR>', { desc = 'Show Molten info' })
      vim.keymap.set('n', '<leader>me', '<cmd>MoltenEvaluateOperator<CR>', { desc = 'Evaluate motion' })
      vim.keymap.set('v', '<leader>me', ':<C-u>MoltenEvaluateVisual<CR>', { desc = 'Evaluate selection' })
      vim.keymap.set('n', '<leader>ml', '<cmd>MoltenEvaluateLine<CR>', { desc = 'Evaluate line' })
      vim.keymap.set('n', '<leader>mr', '<cmd>MoltenReevaluateCell<CR>', { desc = 'Reevaluate cell' })
      vim.keymap.set('n', '<leader>md', '<cmd>MoltenDelete<CR>', { desc = 'Delete cell' })
      vim.keymap.set('n', '<leader>moi', '<cmd>MoltenImagePopup<CR>', { desc = "Open cell's image" })
      vim.keymap.set('n', '<leader>mob', '<cmd>MoltenOpenInBrowser<CR>', { desc = 'Open cell data in browser' })
      vim.keymap.set('n', '<leader>ms', '<cmd>noautocmd MoltenEnterOutput<CR>', { desc = 'Show/Enter Molten output' })
      vim.keymap.set('n', '<leader>mh', '<cmd>MoltenHideOutput<CR>', { desc = 'Hide Molten output' })

      vim.keymap.set('n', '<leader>mip', function()
        local venv = os.getenv 'VIRTUAL_ENV'
        if venv ~= nil then
          -- in the form of /home/moon/.../VENV_NAME/.venv
          local path = string.match(venv, '(.*[/\\])') -- Remove trailing .venv
          venv = string.match(path, '/.+/(.+)') -- Limit to last directory
          venv = string.sub(venv, 1, -2) -- Remove trailing /
          vim.cmd(('MoltenInit %s'):format(venv))
        else
          vim.cmd 'MoltenInit python3'
        end
      end, { desc = 'Initialize Molten for python3', silent = true })
    end,
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    '3rd/image.nvim',
    opts = {
      backend = 'kitty', -- whatever backend you would like to use
      -- max_width = 200,
      -- max_height = 24,
      -- max_height_window_percentage = math.huge,
      -- max_width_window_percentage = math.huge,
      -- window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      -- window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
    },
  },
}
