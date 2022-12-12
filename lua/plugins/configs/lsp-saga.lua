local status_ok, lsp_saga = pcall(require, 'lspsaga')

if not status_ok then
	return
end

lsp_saga.init_lsp_saga({
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
