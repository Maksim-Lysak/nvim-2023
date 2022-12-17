local status_ok, lspinstaller = pcall(require, 'nvim-lsp-installer')

if not status_ok then
	return
end

lspinstaller.setup {
	ensure_installed = {
		'cssls', -- CSS
		'emmet_ls', -- HTML
		'jedi_language_server', -- Python
		'sumneko_lua', -- Lua
		'tsserver', -- Typescript, Javascript
		'volar' -- Vue
	},
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
}

local lspconfig = require 'lspconfig'
-- Возможности редактора
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- удалить ошибки диагностики в левом столбце (SignColumn)
vim.diagnostic.config({
	signs = false,
	virtual_text = false
})

-- Убрать виртуальный тексе

-- Добавляем возможность использовать сниппеты
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs(lspinstaller.get_installed_servers()) do
	lspconfig[server.name].setup {
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
	}
end

require 'lspconfig'.tsserver.setup {
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,

}
