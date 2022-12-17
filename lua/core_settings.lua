local g = vim.g       -- global variables
local opt = vim.opt   -- global / buffer / windows-scoped options
local cmd = vim.cmd   -- выполнять команды Vim

-- настройки для nvim-tree
g.loaded = 1
g.loaded_netrwPlugin = 1

-- bufferlien
opt.termguicolors = true

-- номере строки
opt.number = true

-- Игнорировать регистр при поиске
opt.ignorecase = true

-- Не игнорировать регистр, если есть символы в верхнем регистре
opt.smartcase = true

-- Подсвечивать найденные текстовые объекты
opt.showmatch = true

--[[ Табы ]]--
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.fileformat = unix
opt.cursorline = true               -- Подсветка строки с курсором
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз

opt.clipboard = 'unnamedplus'				-- Используем системный буфер обмена

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

