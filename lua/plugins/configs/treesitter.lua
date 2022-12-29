local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not status_ok then
	return
end

treesitter.setup {
	-- Нужные парсеры
	ensure_installed = {
		"css", "vim", "html", "json", "tsx", "php", "regex", "markdown", "markdown_inline", "http", "graphql", "bash", "cpp",
		"arduino", "scss", "javascript", "python", "lua", "typescript", "vue", "dockerfile"
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
	},
}
