local status_ok, runner = pcall(require, 'code_runner')

if not status_ok then
	return
end

runner.setup({
	focus = true,
  filetype = {
		python = "python3 -u",
		javascript = "node"
	},
})
