return {
  'ggandor/leap.nvim',
  config = function()
    -- require('leap').create_default_mappings()
    vim.keymap.set({ 'n', 'x', 'o' }, 'l', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'L', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'gl', '<Plug>(leap-from-window)')
  end,
  lazy = false,
}
