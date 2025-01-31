-- Mason: Language server package manager for vim ------------------------------
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "vimls"}
}

-- nvim-cmp: Completion engine for Nvim ----------------------------------------
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
	  -- completion = cmp.config.window.bordered(),
	  -- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		-- Accept currently selected item. Set `select` to `false` to only 
		-- confirm explicitly selected items.
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, {'i', 's'}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {'i', 's'}),
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'luasnip' },
	  { name = 'buffer' },
	  { name = 'path' },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't 
-- work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't 
-- work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP configs
require('lspconfig')["vimls"].setup({
	capabilities = capabilities
})
require('lspconfig').marksman.setup({})
require('lspconfig')["clangd"].setup({
	capabilities = capabilities
})
require('lspconfig')['lua_ls'].setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			},
			telemetry = false,
		}
	}
})

-- TreeSitter: Syntax Highlighting ---------------------------------------------
require 'nvim-treesitter.configs'.setup ({
  highlight = {
	  enable = true,
  }
})

-- NvimTree: File Explorer Sidebar ---------------------------------------------
require("nvim-tree").setup()
require("nvim-autopairs").setup({
  check_ts = true,
})
vim.keymap.set('n', '<M-1>', ':NvimTreeToggle<CR>', {silent = true})

-- 42 Header: Creates the official 42 header required for 42 files. ------------
require("42header").setup({
  user = "dmontesd",
  mail = "dmontesd@student.42madrid.com",
})

-- Theme -----------------------------------------------------------------------
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_enable_italic = 1

-- Filetype Plugin -------------------------------------------------------------

-- C Filetype
vim.api.nvim_create_autocmd(
    "BufEnter",
    {
        pattern = {'*.c', '*.h'},
        callback = function ()
            vim.bo.expandtab = false
        end,
    }
)

-- LuaLine: Tabs on NVim -------------------------------------------------------
require("lualine").setup({
    options = { theme = 'gruvbox' },
    tabline = {
        lualine_a = {{
            'tabs',
            mode = 2,
            path = 1,
            max_length = vim.o.columns,
        }},
    },
})
