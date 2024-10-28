-- Tab navigation
vim.api.nvim_set_keymap('n', '<S-l>', ':tabn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':tabp<CR>', { noremap = true, silent = true })

-- Split navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Folding
vim.api.nvim_set_keymap('n', '<F1>', 'za', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F1>', 'zf', { noremap = true, silent = true })

-- Window and buffer mappings
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
