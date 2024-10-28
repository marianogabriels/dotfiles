local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tomasr/molokai'
  use 'elixir-editors/vim-elixir'

  use {
      'hrsh7th/nvim-cmp',
      requires = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'saadparwaiz1/cmp_luasnip',
          'L3MON4D3/LuaSnip'
      },
      config = function()
          local cmp = require('cmp')
          local luasnip = require('luasnip')

          cmp.setup({
              snippet = {
                  expand = function(args)
                      luasnip.lsp_expand(args.body)
                  end,
              },
              mapping = {
                  -- avoid <CR> autocompletion
                  ['<CR>'] = cmp.mapping(function(fallback)
                      if cmp.visible() and cmp.get_active_entry() then
                          cmp.confirm({ select = false })
                      else
                          fallback()
                      end
                  end, { 'i', 's' }),
                  ['<Tab>'] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                          cmp.select_next_item()
                      elseif luasnip.expand_or_jumpable() then
                          luasnip.expand_or_jump()
                      else
                          fallback()
                      end
                  end, { 'i', 's' }),
                  ['<S-Tab>'] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                          cmp.select_prev_item()
                      elseif luasnip.jumpable(-1) then
                          luasnip.jump(-1)
                      else
                          fallback()
                      end
                  end, { 'i', 's' }),
              },
              sources = cmp.config.sources({
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' },
              }, {
                  { name = 'buffer' },
              })
          })
      end
  }

  -- Fuzzy Finder (fzf.vim)
  use {
      'junegunn/fzf',
      run = function()
          vim.fn['fzf#install']()
      end
  }
  use 'junegunn/fzf.vim'
  use 'preservim/nerdtree'

use {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.elixirls.setup({
      cmd = { "~/elixir-ls/release/language_server.sh" },
      settings = {
        elixirLS = {
          dialyzerEnabled = true,
          fetchDeps = true,
          importDeps = true,
          suggestSpecs = true,
          lineLength = 120
        }
      },
      init_options = {
        autoImport = true,
        suggestSpecs = true,
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
      end,
    })
  end
}
  if packer_bootstrap then
      require('packer').sync()
  end
end)
