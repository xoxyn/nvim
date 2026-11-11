vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>ch", "<cmd>Telescope git_commits<cr>")
keymap("n", "<leader>T", "<cmd>Telescope<cr>")
local mono_active = false

keymap("n", "<leader>tm", function()
    local files = vim.fn.globpath(vim.fn.stdpath("config") .. "/colors", "*.lua", false, true)
    local themes = vim.tbl_map(function(f) return vim.fn.fnamemodify(f, ":t:r") end, files)
    vim.ui.select(themes, { prompt = "Theme:" }, function(choice)
        if choice then vim.cmd.colorscheme(choice) end
    end)
end, { desc = "Pick theme" })

keymap({ "n", "v" }, "<leader>d", '"_d', { desc = "Black hole delete" })
keymap('n', '<leader>ft', '<cmd>TodoTelescope<CR>')
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-d>', '<C-d>zz')
keymap("i", "jj", "<Esc>")
keymap('n', '<leader>rn', vim.lsp.buf.rename)
keymap('n', '<leader>b', function() print('real lua function') end)
keymap("n", "<leader>uw", ":set wrap!<CR>")
keymap('n', '<leader>pv', '<cmd>:Oil<cr>')
keymap('n', '<leader>R', '<cmd>:restart<cr>')
keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>")
keymap("n", "dw", '"_daw')
keymap("n", "<leader>to", "<cmd>tabnew<CR>")
keymap("n", "<leader>tx", "<cmd>tabclose<CR>")
keymap("n", "<leader>tn", "<cmd>tabn<CR>")
keymap("n", "<leader>tp", "<cmd>tabp<CR>")
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>")
keymap('n', '<leader>q', '<cmd>:q<cr>')
keymap("n", "<C-a>", "ggVG")
keymap("n", "wr", ":vertical resize +5<CR>")
keymap("n", "wl", ":vertical resize -5<CR>")
keymap("n", "wk", ":resize +2<CR>")
keymap("n", "wj", ":resize -2<CR>")
keymap('n', 'sv', '<cmd>:vs<cr>')
keymap('n', 'ss', '<cmd>:sp<cr>')
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")
keymap("n", "<leader>nh", ":nohl<CR>")
keymap('n', '<leader>lg', '<cmd>LazyGit<cr>')
keymap("n", "<leader>fR", "<cmd>FlutterRun<CR>")
keymap("n", "<leader>fr", "<cmd>FlutterReload<CR>")
keymap('n', '<leader>xd', "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
keymap('n', '<leader>xw', "<cmd>Trouble diagnostics toggle<cr>")
keymap("n", "<leader>fq", "<cmd>FlutterQuit<CR>")
keymap("n", "<leader>wr", "<cmd>AutoSession restore<CR>")
keymap("n", "<leader>ws", "<cmd>AutoSession save<CR>")
keymap("n", "<leader>z", "za", { desc = "Toggle fold" })
keymap("n", "<leader>ts", function()
    if vim.b.ts_disabled then
        pcall(vim.treesitter.start)
        vim.b.ts_disabled = false
    else
        vim.treesitter.stop()
        vim.b.ts_disabled = true
    end
end)

keymap("n", "<leader>tc", "<cmd>TSContext toggle<cr>", { desc = "Toggle context" })
keymap("n", "[c", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Jump to function start" })

-- gitsigns
keymap("n", "<leader>gb",
    function()
        require("gitsigns").blame_line()
    end
)

keymap("n",
    "<leader>gB",
    function()
        require("gitsigns").blame()
    end
)

keymap("n",
    "<leader>gs",
    function()
        local gs = require("gitsigns")
        if #(gs.get_hunks() or {}) > 0 then
            gs.stage_buffer()
        else
            gs.reset_buffer_index()
        end
    end
)

keymap("n",
    "<leader>gh",
    function()
        require("gitsigns").stage_hunk()
    end
)

-- Codediff
keymap("n", "<leader>dv", "<cmd>CodeDiff<cr>")
keymap("n", "<leader>dh", "<cmd>CodeDiff history %<cr>")
keymap("n", "<leader>dH", "<cmd>CodeDiff history<cr>")

-- img preview keybinds
keymap("n", "<leader>ti", function()
    local img = require("image")
    if img.is_enabled() then
        img.disable()
    else
        img.enable()
    end
end, { desc = "Toggle image.nvim" })

-- Terminal keymaps
keymap("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Terminal in vertical split" })
keymap("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Terminal in horizontal split" })
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt_local.modified = false
    end,
})

keymap("n", "<leader>rs", function()
    local filetype = vim.bo.filetype

    if filetype == 'rust' then
        local root_dir = vim.fn.getcwd()
        local cargo_toml = root_dir .. '/Cargo.toml'

        if vim.fn.filereadable(cargo_toml) == 1 then
            -- Cargo project: build and run
            vim.cmd('terminal cargo run')
        else
            -- Single file fallback via rustc
            local filename = vim.fn.expand('%')
            local output = '/tmp/' .. vim.fn.expand('%:t:r')
            vim.cmd('terminal rustc ' .. filename .. ' -o ' .. output .. ' && ' .. output)
        end
    else
        print('Not a Rust file')
    end
end, { desc = "Run Rust program or Cargo project" })

-- Run with arguments
keymap("n", "<leader>ra", function()
    local filetype = vim.bo.filetype

    if filetype == 'rust' then
        local root_dir = vim.fn.getcwd()
        local cargo_toml = root_dir .. '/Cargo.toml'

        local args = vim.fn.input('Arguments: ')

        if vim.fn.filereadable(cargo_toml) == 1 then
            -- Cargo project: pass args after '--'
            vim.cmd('terminal cargo run -- ' .. args)
        else
            -- Single file fallback via rustc
            local filename = vim.fn.expand('%')
            local output = '/tmp/' .. vim.fn.expand('%:t:r')
            vim.cmd('terminal rustc ' .. filename .. ' -o ' .. output .. ' && ' .. output .. ' ' .. args)
        end
    else
        print('Not a Rust file')
    end
end, { desc = "Run Rust program with arguments" })
