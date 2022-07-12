local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<SPACE>", "<NOP>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- MODES
--			normal - n
--			insert - i
--			visual - v
--			visual_block - x
--			terminal - t
--			command - c

--	NORMAL	--
-- init.lua edditink
keymap("n", "<leader>sc", ":e ~/.config/nvim/init.lua<CR>", opts)

-- buildProject CUSTOMS --
keymap("n", "<F2>", ":term cmake -S . -B ./build && mv ./build/compile_commands.json .<CR>", opts)
keymap("n", "<F5>", ":term ./compile.sh<CR>", term_opts)
keymap("n", "<F8>", ":<bar> term ./build.sh<CR>", term_opts)
keymap("n", "<C-F8>", ":split <bar> term ./build.sh<CR>", term_opts)

keymap("n", "<leader>vs", ":split<CR>", opts)
keymap("n", "<leader>hs", ":vsplit<CR>", opts)

-- open new file
keymap("n", "gf", ":e <cfile><CR>", opts)

-- substitute spaces for tabs
keymap("n", "<leader>4s", ":%s/    /<TAB>/g<CR>", opts)
keymap("n", "<leader>2s", ":%s/  /<TAB>/g<CR>", opts)

keymap("n", "<leader>lg", "<CMD>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>py", "<CMD>lua _PYTHON_TOGGLE()<CR>", opts)
keymap("n", "<leader>ht", "<CMD>lua _HTOP_TOGGLE()<CR>", opts)
keymap("n", "<leader>nd", "<CMD>lua _NCDU_TOGGLE()<CR>", opts)

-- TELESCOPE --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- telescope git commands
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts)
keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts)

-- GIT signs
keymap("n", "gp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "gbl", ":Gitsigns blame_line<CR>", opts)
keymap("n", "gsh", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "gsb", ":Gitsigns stage_buffer<CR>", opts)
keymap("n", "grh", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "gtd", ":Gitsigns toggle_deleted<CR>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", opts)

---@diagnostic disable-next-line: lowercase-global
function getCommitIndex()
	local commit = vim.fn.input("Enter commit: ", "HEAD~")
	require("gitsigns").diffthis(commit)
end
keymap("n", "<leader>gd", ":lua getCommitIndex()<CR>", opts)

-- SAVING --
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)
keymap("n", "<leader>qq", ":q<CR>", opts)
keymap("n", "<leader>bw", ":w <bar> :Bdelete! %d <CR>", opts) -- buffer writing
keymap("n", "<leader>bd", ":Bdelete! %d<CR>", opts) -- buffer delete force

-- Resize with arrows
keymap("n", "<C-UP>", ":resize -2<CR>", opts)
keymap("n", "<C-DOWN>", ":resize +2<CR>", opts)
keymap("n", "<C-LEFT>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-RIGHT>", ":vertical resize +2<CR>", opts)

--	NAVIGATE WINDOWS	--
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 15<CR>", opts)

-- NAVIGATE BUFFERS --
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- MOVE TEXT UP & DOWN
-- keymap("n", "<A-S-k>", "<ESC>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-S-j>", "<ESC>:m .-2<CR>==gi", opts)
keymap("n", "<C-S-j>", ":move '<-2<CR>", opts)
keymap("n", "<C-S-k>", ":move '>+1<CR>", opts)

-- NEOGEN
keymap("n", "<leader>nc", ":lua require('neogen').generate({ type = 'class'})<CR>", opts)
keymap("n", "<leader>nf", ":lua require('neogen').generate({ type = 'func'})<CR>", opts)
keymap("n", "<leader>nt", ":lua require('neogen').generate({ type = 'type'})<CR>", opts)
keymap("n", "<leader>ni", ":lua require('neogen').generate({ type = 'file'})<CR>", opts)

-- BOOKMARKS
keymap("n", "<leader>ba", ":BookmarkAnnotate<CR>", opts)
keymap("n", "<leader>bc", ":BookmarkClear<CR>", opts)
keymap("n", "<leader>be", ":BookmarkClearAll<CR>", opts)
keymap("n", "<leader>bm", ":BookmarkMoveToLine<CR>", opts)
keymap("n", "<leader>bs", ":BookmarkSave", opts)
keymap("n", "<leader>bl", ":BookmarkLoad", opts)
keymap("n", "<leader>bp", ":BookmarkPrev<CR>", opts)
keymap("n", "<leader>bl", ":BookmarkNext<CR>", opts)
keymap("n", "<leader>bb", ":BookmarkShowAll<CR>", opts)

keymap("n", "<leader>tr", "<cmd>Trouble<cr>",opts)
keymap("n", "<leader>twd", "<cmd>Trouble workspace_diagnostics<cr>",opts)
keymap("n", "<leader>tdd", "<cmd>Trouble document_diagnostics<cr>",opts)
keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>",opts)
keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>",opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",opts)

-- Press jk fast to enter
keymap("i", "jj", "<ESC>:w<CR>", opts)
keymap("i", "kk", "<ESC>", opts)

-- Visual --

-- REFACTORING --
local visual_opts = {noremap = true, silent = true, expr = false}
keymap("v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", visual_opts)

-- -- Remaps for the refactoring operations currently offered by the plugin
-- keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], visual_opts)
-- keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], visual_opts)
-- keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], visual_opts)
-- keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], visual_opts)
--
-- -- Extract block doesn't need visual mode
-- keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], visual_opts)
-- keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], visual_opts)
--
-- -- Inline variable can also pick up the identifier currently under the cursor without visual mode
-- keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], visual_opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-DOWN>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-UP>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- ROS
-- :lua require'telescope'.extensions.ros.packages{cwd=os.getenv("ROS_WORKSPACE") or "."}
keymap("n", "<leader>rp", ":lua require'telescope'.extensions.ros.packages{cwd=\".\"}<CR>", opts)
