local status_ok, autotag = pcall(require, 'nvim-ts-autotag')

if not autotag then
	return
end

autotag.setup()
