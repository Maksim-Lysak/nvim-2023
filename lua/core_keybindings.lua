local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Переназначаем клавишу 'leader'
-- keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- 'jj' в замен 'Esc' 
keymap('i', 'jk', '<Esc>', opts)

-- Переход на следующую строку как 'crl-enter'
keymap('', '<M-o>', ':<Esc>o', opts)

-- убрать выделение с текста
keymap('n', '<C-l>', ':noh<CR>', opts)

-- перевод курсора  в конец строки
-- keymap('i', '<S-Space>', ':<Esc>', opts)

-- работа с буфером
keymap('', 'gw', ':bd<CR>', opts)                   -- закрыть текущий буфер
keymap('', 'gj', ':wincmd j<CR>', opts)             -- переместить курсор на нижний буфер
keymap('', 'gh', ':wincmd h<CR>', opts)             -- переместить курсор на левый буфер
keymap('', 'gk', ':wincmd k<CR>', opts)             -- переместить курсор на верхний буфер
keymap('', 'gl', ':wincmd l<CR>', opts)             -- переместить курсор на правый буфер

-- перемещение строк с зажатой кнопкой 'alt'
keymap('n', '<M-j>', ':m .+1<CR>', opts)            -- Перемещение стоки в низ нормальном режиме
keymap('n', '<M-k>', ':m .-2<CR>', opts)            -- Перемещение стоки в верх нормальном режиме
keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", opts)      -- Перемещение строки в низ в режиме ввода
keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", opts)      -- Перемещение строки в верх в режиме ввода
keymap('i', '<M-k>', '<Esc>:m .-2<CR>==gi', opts)   -- Перемещие выделеного блока кода в вниз
keymap('i', '<M-j>', '<Esc>:m .+1<CR>==gi', opts)   -- Перемещие выделеного блока кода в верх
