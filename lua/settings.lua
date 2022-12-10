-- theme darkplus
vim.cmd[[colorscheme darkplus]]

-- luline
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
-- 		theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--     globalstatus = false,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }

-- nvim-surround
require('nvim-surround').setup()

-- telescope
require('telescope').setup()

-- nvim-comment
require('nvim_comment').setup()

-- nvim-autopairs
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" , "vim" },
})

-- hop
require("hop").setup({
	keys = 'etovxqpdygfblzhckisuran'
})

-- trouble
require('trouble').setup({})

-- bufferline
-- require("bufferline").setup{
-- 	options = {
-- 		show_buffer_close_icons = false,
--     show_close_icon = false,
--     offsets = {
--         {
--             filetype = "NvimTree",
--             text = "File Explorer",
--             highlight = "Directory",
--             separator = true
--         }
--     }
-- 	}
-- }

-- nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- tree-sitter
require'nvim-treesitter.configs'.setup {
	-- Нужные парсеры
	ensure_installed = {
		"css", "vim", "html", "json", "tsx", "php", "regex", "markdown", "markdown_inline", "http", "graphql", "bash", "cpp", "arduino", "scss", "javascript", "python", "lua", "typescript","vue", "dockerfile"
	},
	-- Устанавливать парсеры синхронно
	sync_install = false,
	-- Включить автозакрытие тегов
	autotag = {
    enable = true,
  },
	-- Подсветка
	highlight = {
		-- Включить расшируение
		enable = true,
		disable = {},
	},
	indent = {
		-- Включить indent
		enable = false,
		disable = {},
	}
}

require('code_runner').setup({
  -- put here the commands by filetype
	focus = false,
  filetype = {
		python = "python3 -u",
		-- typescript = "node run",
		javascript = "node"
	},
})

-- nvim-ts-autotag
require('nvim-ts-autotag').setup()

-- LSP
-- Берем плагин для установки LSP
local lspinstaller = require'nvim-lsp-installer'

-- Конфигурация для LSP
local lspconfig = require'lspconfig'

-- Конфигурируем lsp-installer
lspinstaller.setup{
	ensure_installed = {
		'cssls',                  -- CSS
		'emmet_ls',               -- HTML
		'jedi_language_server',   -- Python
		'sumneko_lua',            -- Lua
		'tsserver',               -- Typescript, Javascript
		'volar'                   -- Vue
	},
}

-- Возможности редактора
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- удалить ошибки диагностики в левом столбце (SignColumn)
vim.diagnostic.config({signs=false})

-- Добавляем возможность использовать сниппеты
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  lspconfig[server.name].setup{
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  }
end

-- LSP INSTALLER
require("nvim-lsp-installer").setup({
	  automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})


-- lsp saga
require('lspsaga').init_lsp_saga({
	border_style = "single",
	max_preview_lines = 20,
	code_action_lightbulb = {
    enable = true,
    enable_in_insert = true,
    cache_code_action = true,
    sign = false,
    update_time = 150,
    sign_priority = 20,
    virtual_text = false,
},
})


-- CMP
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup{
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Клавиши, которые будут взаимодействовать в nvim-cmp
    mapping = cmp.mapping.preset.insert({
      ['<M-[>'] = cmp.mapping.scroll_docs(-4),
      ['<M-]>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<M-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
			['<M-p>'] = cmp.mapping.select_prev_item(),
			['<M-n>'] = cmp.mapping.select_next_item()
    }),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },                -- LSP 👄
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'luasnip' },                 -- Luasnip 🐌
		{ name = 'buffer' },                  -- Буфферы 🐃
		{ name = 'path' },                    -- Пути 🪤
		-- { name = 'cmdline'}
	}, {
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	}
}
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


-- null_ls
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
    	formatting.prettier.with({ extra_args = {
				"--single-quote", "--jsx-single-quote"
			}}) 

        -- null_ls.builtins.diagnostics.eslint,
    },
})

-- require('lspconfig')['tsserver'].setup{
--     on_attach = function(client)
--         client.server_capabilities.document_formatting = false
--         client.server_capabilities.document_range_formatting = false
--     end,
--     flags = lsp_flags,
-- }
