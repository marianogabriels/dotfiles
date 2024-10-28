-- Fzf configuration
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>', ':Ag<CR>', { noremap = true, silent = true })

-- Fzf actions configuration
vim.g.fzf_action = {
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit',
  ['ctrl-t'] = 'tabnew',
}

-- Set default FZF command
vim.g.FZF_DEFAULT_COMMAND = 'ag --ignore={build,*.log,.git,.project,*.o,*.d,hw_1_5/*} %s -l --hidden -g ""'
