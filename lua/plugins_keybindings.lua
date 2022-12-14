local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- bufferline
keymap('n', '>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<', ':BufferLineCyclePrev<CR>', opts)

-- nvim-tree
keymap("", 'nf', ':NvimTreeFindFile<CR>', opts)
keymap("", 'nn', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', opts)

-- Git
keymap("n", 'Gd', '<cmd>Gitsigns blame_line<CR>', opts)
keymap("n", 'Gp', '<cmd>Gitsigns preview_hunk<CR>', opts)

-- hop
keymap("", ".l", ":HopLine<cr>", opts)
keymap("", ".s", ":HopChar2<cr>", opts)
keymap("", ".w", ":HopWordCurrentLine<cr>", opts)

-- telescope
keymap("", ".fb", ":Telescope buffers<CR>", opts)
keymap("", ".fg", ":Telescope live_grep<CR>", opts)
keymap("", ".fh", ":Telescope help_tags<CR>", opts)
keymap("", ".ff", ":Telescope find_files<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)

-- code_runner
keymap('n', '<leader>r', ':RunCode<CR>', opts)
keymap('n', '<leader>rf', ':RunFile<CR>', opts)
keymap('n', '<leader>rft', ':RunFile tab<CR>', opts)
keymap('n', '<leader>rp', ':RunProject<CR>', opts)
keymap('n', '<leader>rc', ':RunClose<CR>', opts)
keymap('n', '<leader>crf', ':CRFiletype<CR>', opts)
keymap('n', '<leader>crp', ':CRProjects<CR>', opts)

-- lspsaga
-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- Outline
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gD", "<cmd>Lspsaga lsp_finder<CR>", opts)

-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

-- Peek Definition
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
