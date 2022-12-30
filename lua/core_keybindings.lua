local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Переназначаем клавишу 'leader'
vim.g.mapleader = ' '

-- 'jk' в замен 'Esc' 
keymap('i', 'jk', '<Esc>', opts)

-- Переход на следующую строку как 'crl-enter'
keymap('', '<M-o>', ':<Esc>o', opts)

-- убрать выделение с текста
keymap('n', '<C-l>', ':noh<CR>', opts)

-- перевести курсор в конец строки в режиме ввода
keymap('i', '<leader>.', '<Esc>A', opts)

-- работа с буфером
keymap('', 'gw', ':w<CR>', opts)										-- сохранить текущий буфер
keymap('', 'gq', ':bd<CR>', opts)                   -- закрыть текущий буфер
keymap('', 'gj', ':wincmd j<CR>', opts)             -- переместить курсор на нижний буфер
keymap('', 'gh', ':wincmd h<CR>', opts)             -- переместить курсор на левый буфер
keymap('', 'gk', ':wincmd k<CR>', opts)             -- переместить курсор на верхний буфер
keymap('', 'gl', ':wincmd l<CR>', opts)             -- переместить курсор на правый буфер

-- перемещение строк с зажатой кнопкой 'alt'
keymap('n', '<M-[>', ':m .+1<CR>', opts)            -- Перемещение стоки в низ нормальном режиме
keymap('n', '<M-]>', ':m .-2<CR>', opts)            -- Перемещение стоки в верх нормальном режиме
keymap('v', '<M-[>', ":m '>+1<CR>gv=gv", opts)      -- Перемещение строки в низ в режиме ввода
keymap('v', '<M-]>', ":m '<-2<CR>gv=gv", opts)      -- Перемещение строки в верх в режиме ввода
keymap('i', '<M-[>', '<Esc>:m .+1<CR>==gi', opts)   -- Перемещие выделеного блока кода в верх
keymap('i', '<M-]>', '<Esc>:m .-2<CR>==gi', opts)   -- Перемещие выделеного блока кода в вниз

-- форматирование текста
keymap('', '<leader>d', ':lua vim.lsp.buf.format({async=true})<CR>', opts)
