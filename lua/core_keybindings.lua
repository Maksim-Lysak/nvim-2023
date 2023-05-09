local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- [[ Переназначаем клавишу 'leader' ]]
vim.g.mapleader = ' '

-- [[ 'jk' в замен 'Esc' ]]
keymap('i', 'jk', '<Esc>', opts)

-- [[ Переход на следующую строку как 'crl-enter' ]]
keymap('', '<M-o>', ':<Esc>o', opts)

-- [[ убрать выделение с текста ]]
keymap('n', '<C-l>', ':noh<CR>', opts)

-- [[ перевести курсор в конец строки в режиме ввода ]]
keymap('i', '<leader>.', '<Esc>A', opts)

-- [[ работа с буфером ]]
-- сохранить текущий буфер
keymap('', 'gw', ':w<CR>', opts)

-- сохранить текущий буфер в режиме ввода
keymap('i', 'gw', '<Esc>:w<CR>a', opts)

-- закрыть текущий буфер
keymap('', 'gq', ':bd<CR>', opts)

-- переместить курсор на нижний буфер
keymap('', 'gj', ':wincmd j<CR>', opts)

-- переместить курсор на левый буфер
keymap('', 'gh', ':wincmd h<CR>', opts)

-- переместить курсор на верхний буфер
keymap('', 'gk', ':wincmd k<CR>', opts)

-- переместить курсор на правый буфер
keymap('', 'gl', ':wincmd l<CR>', opts)

-- [[ перемещение строк с зажатой кнопкой 'alt' ]]
-- Перемещение стоки в низ нормальном режиме
keymap('n', '<M-[>', ':m .+1<CR>', opts)

-- Перемещение стоки в верх нормальном режиме
keymap('n', '<M-]>', ':m .-2<CR>', opts)

-- Перемещение строки в низ в режиме ввода
keymap('v', '<M-[>', ":m '>+1<CR>gv=gv", opts)

-- Перемещение строки в верх в режиме ввода
keymap('v', '<M-]>', ":m '<-2<CR>gv=gv", opts)

-- Перемещие выделеного блока кода в верх
keymap('i', '<M-[>', '<Esc>:m .+1<CR>==gi', opts)

-- Перемещие выделеного блока кода в вниз
keymap('i', '<M-]>', '<Esc>:m .-2<CR>==gi', opts)

-- [[ форматирование текста ]]
keymap('', '<leader>lf', ':lua vim.lsp.buf.format({async=true})<CR>', opts)
