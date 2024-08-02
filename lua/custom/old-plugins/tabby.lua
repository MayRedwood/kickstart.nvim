return {
  'nanozuki/tabby.nvim',
  event = 'VimEnter', -- if you want lazy load, see below
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- require('tabby').setup({
    --   preset = 'active_wins_at_tail',
    --   option = {
    --     theme = {
    --       fill = 'TabLineFill',       -- tabline background
    --       head = 'TabLine',           -- head element highlight
    --       current_tab = 'TabLineSel', -- current tab label highlight
    --       tab = 'TabLine',            -- other tab label highlight
    --       win = 'TabLine',            -- window highlight
    --       tail = 'TabLine',           -- tail element highlight
    --     },
    --     nerdfont = true,              -- whether use nerdfont
    --     tab_name = {
    --       name_fallback = function(tabid)
    --         return vim.api.nvim_tabpage_get_number(tabid)
    --       end,
    --     },
    --     buf_name = {
    --       mode = "'unique'|'relative'|'tail'|'shorten'",
    --     },
    --   },
    -- })
    local theme = {
      fill = 'Terminal',
      -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
      head = 'TabLine',
      current_tab = 'TabLineSel',
      tab = 'TabLine',
      win = 'TabLine',
      tail = 'StatusLineNC',
    }
    require('tabby').setup({
      line = function(line)
        return {
          {
            -- line.sep('', theme.current_tab, theme.fill),
            { '  ', hl = theme.current_tab },
            line.sep('', theme.current_tab, theme.fill),
            -- line.sep('', theme.current_tab, theme.fill),
            -- line.sep(' ', theme.current_tab, theme.tail),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              -- line.sep(' ', hl, theme.fill),
              line.sep('', theme.fill, hl),
              -- tab.is_current() and '' or '',
              -- tab.number(),
              -- { ' ' },
              tab.name(),
              tab.close_btn(''),
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              { ' ' },
              -- line.sep('', theme.win, theme.fill),
              win.is_current() and '' or '',
              { ' ' },
              win.buf_name(),
              { ' ' },
              line.sep(' ', theme.win, theme.tail),
              -- line.sep('', theme.win, theme.fill),
              hl = theme.win,
              -- margin = ' ',
            }
          end),
          {
            -- line.sep(' ', theme.tail, theme.fill),
            -- line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.win },
            line.sep('', theme.win, theme.fill),
          },
          hl = theme.fill,
        }
      end,
    })
  end,
}
