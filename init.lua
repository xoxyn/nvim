require("keymaps")
require("builds_cpp")

local colors = {
    black      = "#000000",
    white      = "#ffffff",
    light_gray = "#222222",
    gray       = "#555555",
}

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = false
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.mouse = "a"
opt.wrap = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = true
opt.foldlevel = 2
opt.guicursor = ""
vim.opt.list = true
vim.opt.listchars = {
    space = "·",
    tab = "→",
    nbsp = "␣",
}

vim.loader.enable();
vim.cmd.colorscheme("everforest")
-- Plugins --

local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
vim.pack.add({ gh('nvim-treesitter/nvim-treesitter-context') })
vim.pack.add({ gh('stevearc/oil.nvim') })
vim.pack.add({ gh('williamboman/mason.nvim') })
vim.pack.add({ gh('williamboman/mason-lspconfig.nvim') })
vim.pack.add({ gh('kdheepak/lazygit.nvim') })
vim.pack.add({ gh('nvim-lua/plenary.nvim') })
vim.pack.add({ gh('lewis6991/gitsigns.nvim') })
vim.pack.add({ gh('nvim-flutter/flutter-tools.nvim') })
vim.pack.add({ gh('stevearc/dressing.nvim') })
vim.pack.add({ gh('b0o/incline.nvim') })
vim.pack.add({ gh('saghen/blink.cmp') })
vim.pack.add({ gh('nvim-lualine/lualine.nvim') })
vim.pack.add({ gh('nvim-tree/nvim-web-devicons') })
vim.pack.add({ gh('rmagatti/auto-session') })
vim.pack.add({ gh('kylechui/nvim-surround') })
vim.pack.add({ gh('echasnovski/mini.pairs') })
vim.pack.add({ gh('akinsho/toggleterm.nvim') })
vim.pack.add({ gh('nvim-telescope/telescope.nvim') })
vim.pack.add({ gh('folke/todo-comments.nvim') })
vim.pack.add({ gh('folke/noice.nvim') })
vim.pack.add({ gh('MunifTanjim/nui.nvim') })
vim.pack.add({ gh('rcarriga/nvim-notify') })
vim.pack.add({ gh('folke/trouble.nvim') })
vim.pack.add({ gh('goolord/alpha-nvim') })
vim.pack.add({ gh('windwp/nvim-ts-autotag') })
vim.pack.add({ gh('3rd/image.nvim') })
vim.pack.add({ gh('esmuellert/codediff.nvim') })
vim.pack.add({ gh('stevearc/conform.nvim') }) -- Added: formatter (prettier etc.)
-- vim.pack.add({ gh('vhyrro/luarocks.nvim') }) -- only if using magick_rock
vim.pack.add({ gh('Civitasv/cmake-tools.nvim') })
vim.pack.add({ gh('neovim/nvim-lspconfig') })


require('trouble').setup()
require('nvim-ts-autotag').setup()
require('dressing').setup()

require('notify').setup({
    background_colour = "#000000",
    render            = "minimal",
    stages            = "static",
    timeout           = 2500,
    top_down          = false,
})

require('noice').setup({
    presets = { lsp_doc_border = true },
    notify  = { enabled = true },
    cmdline = {
        view   = "cmdline",
        format = {
            search_down = { view = "cmdline" },
            search_up   = { view = "cmdline" },
        },
    },
    routes  = {
        {
            filter = {
                event = "msg_show",
                any   = {
                    { find = "written" },
                    { find = "yanked" },
                    { find = "change" },
                    { find = "line" },
                },
            },
            opts = { skip = true },
        },
    },
})

require('telescope').setup({
    defaults = {
        prompt_prefix    = "  ",
        selection_caret  = " ",
        sorting_strategy = "ascending",
        layout_strategy  = "horizontal",
        layout_config    = {
            prompt_position = "top",
            width           = 0.87,
            height          = 0.80,
            horizontal      = {
                preview_width = 0.55,
            },
        },
        border           = true,
        borderchars      = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        winblend         = 0,
        color_devicons   = false,
    },
})

require("codediff").setup({
    -- explorer = {
    --   formatters = {
    --     group = function(ctx)
    --       return {
    --         left = {{
    --           segments = {{ text = " " .. ctx.label, hl = "CodeDiffExplorerTreeGroup" }},
    --           truncate_priority = 1,
    --         }},
    --         right = {{
    --           segments = {{ text = ctx.file_count .. " files", hl = "Number" }},
    --         }},
    --       }
    --     end,
    --   },
    -- },
})

require('todo-comments').setup()

require('toggleterm').setup({
    size = 15,
    open_mapping = [[<c-\>]],
    direction = 'horizontal',
    shade_terminals = false,
})

require("mini.pairs").setup()

require("auto-session").setup({
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
})

require('lualine').setup({
    options = {
        theme = "auto",
        -- theme = {
        --     normal   = { a = { bg = colors.white, fg = colors.black, gui = "bold" }, b = { bg = colors.light_gray, fg = colors.black }, c = { bg = colors.black, fg = colors.white } },
        --     insert   = { a = { bg = colors.light_gray, fg = colors.black, gui = "bold" }, b = { bg = colors.light_gray, fg = colors.black }, c = { bg = colors.black, fg = colors.white } },
        --     visual   = { a = { bg = colors.gray, fg = colors.white, gui = "bold" }, b = { bg = colors.light_gray, fg = colors.black }, c = { bg = colors.black, fg = colors.white } },
        --     command  = { a = { bg = colors.gray, fg = colors.white, gui = "bold" }, b = { bg = colors.light_gray, fg = colors.black }, c = { bg = colors.black, fg = colors.white } },
        --     replace  = { a = { bg = colors.black, fg = colors.white, gui = "bold" }, b = { bg = colors.light_gray, fg = colors.black }, c = { bg = colors.black, fg = colors.white } },
        --     inactive = { a = { bg = colors.black, fg = colors.gray, gui = "bold" }, b = { bg = colors.black, fg = colors.gray }, c = { bg = colors.black, fg = colors.gray } },
        -- },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { {
            'branch',
            color = { fg = colors.white, bg = colors.light_gray },
        }, 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
    },
})

require('blink.cmp').setup({
    keymap = {
        preset        = "none",
        ["<Tab>"]     = { "snippet_forward", "select_and_accept", "fallback" },
        ["<S-Tab>"]   = { "snippet_backward", "fallback" },
        ["<C-n>"]     = { "select_next", "fallback" },
        ["<C-p>"]     = { "select_prev", "fallback" },
        ["<CR>"]      = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"]     = { "hide" },
    },
    sources = {
        default = { "lsp", "path", "buffer" },
    },
    fuzzy = { implementation = "lua" },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
    },

    signature = {
        enabled = true,
    },
})

-- conform.nvim: handles formatting for filetypes whose LSP doesn't provide it
-- Make sure prettier is installed: npm install -g prettier
-- Or install via Mason: :MasonInstall prettier
require('conform').setup({
    formatters_by_ft = {
        html            = { 'prettier' },
        css             = { 'prettier' },
        scss            = { 'prettier' },
        javascript      = { 'prettier' },
        typescript      = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte          = { 'prettier' },
        json            = { 'prettier' },
        jsonc           = { 'prettier' },
        yaml            = { 'prettier' },
        markdown        = { 'prettier' },
    },
    format_on_save = nil, -- set to { timeout_ms = 500 } if you want auto-format on save
})

require('incline').setup({
    highlight = {
        groups = {
            InclineNormal = {
                guifg = colors.black,
                guibg = colors.white,
            },
            InclineNormalNC = {
                guibg = "#d0d0d0",
                guifg = colors.black,
            },
        },
    },
    window = {
        margin = { vertical = 1, horizontal = 1 },
        padding = 1,
        placement = {
            horizontal = "right",
            vertical = "top",
        },
    },
    render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
            filename = filename .. " ●"
        end
        return filename
    end,
})

-- Removed undefined `on_attach` and `capabilities` from flutter-tools lsp config.
-- flutter-tools will use its own defaults which is correct behaviour.
require('flutter-tools').setup({
    flutter_path = "/home/nyxox/flutter/bin/flutter",
    flutter_lookup_cmd = nil,
    fvm = false,
    lsp = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
    },
})

require("gitsigns").setup()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls', 'zls', 'ts_ls', 'clangd', 'html', 'cssls', 'svelte', 'pyright', 'jsonls', 'taplo', 'yamlls', 'bashls', 'dockerls', 'tailwindcss' },
    automatic_installation = true,
})
require("lsp")

require("oil").setup({
    view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
        end,
    },
})

require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
}

require('treesitter-context').setup({
    enable = true,
    max_lines = 3,
    trim_scope = 'inner',
    mode = 'cursor',
    multiline_threshold = 1,
    separator = nil,
})


-- Parsers
require('nvim-treesitter').install { 'rust', 'javascript', 'zig', 'lua', 'vimdoc', 'go', 'query', 'markdown', 'cpp', 'css', 'json', 'html', 'dockerfile', 'svelte', 'python', 'r', 'java', 'bash', 'jsonc', 'yaml', 'dockerfile', 'typescript', 'tsx', 'toml', 'cmake', 'glsl', 'markdown_inline', 'regex', 'luadoc', 'vim', 'diff' }


-- For jsonl files
vim.filetype.add({
    extension = {
        jsonl = 'jsonl',
    },
})

vim.treesitter.language.register('json', 'jsonl')

require('image').setup({
    backend = "kitty",
    processor = "magick_cli",
    integrations = {
        markdown = { enabled = true },
    },
    max_height_window_percentage = 50,
})

require("cmake-tools").setup({
    cmake_use_preset = true,
    cmake_regenerate_on_save = true,
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_directory = "build/${variant:buildType}",

    -- symlink compile_commands.json into the project root for clangd
    -- cmake_compile_commands_options = {
    --     action = "soft_link",
    --     target = vim.loop.cwd,
    -- },

    -- builds go to quickfix so errors are jumpable
    cmake_executor = {
        name = "quickfix",
        opts = {
            show = "only_on_error",
            position = "belowright",
            size = 12,
        },
    },

    -- the program runs in toggleterm so interactive I/O works
    cmake_runner = {
        name = "toggleterm",
        opts = {
            direction = "horizontal",
            close_on_exit = false,
            auto_scroll = true,
            singleton = true,
        },
    },

    cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
    },

    -- set to true if you want the target name shown at the right edge;
    -- off here so it doesn't crowd incline's filename label
    cmake_virtual_text_support = false,
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

local builtin = require('telescope.builtin')

local keymap = vim.keymap.set
keymap('n', ';f', builtin.find_files)
keymap('n', ';F', function()
    builtin.find_files({ hidden = true, no_ignore = true })
end)
keymap('n', ';r', builtin.live_grep)
keymap('n', ';b', builtin.buffers)
keymap('n', ';h', builtin.help_tags)

vim.cmd("syntax on")

local alpha = require('alpha')
local dashboard = require('alpha.themes.startify')

local header = {
    type = "text",
    val = {
        [[    /^ ^\           ]],
        [[   / 0 0 \          ]],
        [[   V\ Y /V          ]],
        [[    / - \           ]],
        [[   /    |           ]],
        [[  V__) ||           ]],
        [[                    ]],
        [[  - G O O D BOY -   ]],
    },
    opts = {
        position = "center",
        hl = "Normal",
    },
}

local layout = {
    { type = "padding", val = math.floor(vim.o.lines / 3) },
    header,
    { type = "padding", val = 2 },
    actions,
}

alpha.setup({ layout = layout, opts = {} })

vim.api.nvim_create_user_command("Digraphs", function()
    vim.cmd("new")
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "wipe"
    vim.cmd("put =execute('digraphs')")
    vim.cmd("1delete")
end, {})
