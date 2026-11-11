local function hl(group, opts)
    local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    vim.api.nvim_set_hl(0, group, vim.tbl_extend('force', ok and current or {}, opts))
end

-- Each theme is just a table of colors
local themes = {
    black = {
        bg = "#000000",
        selected = "#222222",
        prompt_bg = "#111111",
        fg = "#d3c6aa",
        bright = "#ffffff",
        dim = "#555555",
        kind = "#a7c080",
        extra = "#859289",
        extra_sel = "#a7b0a3",
        match = "#e69875",
        context_ln = "#909090",
    },
}

local function apply(t)
    -- completion menu
    hl("Pmenu", { fg = t.fg, bg = t.bg })
    hl("PmenuSel", { fg = t.bright, bg = t.selected, bold = true })
    hl("PmenuKind", { fg = t.kind, bg = t.bg })
    hl("PmenuKindSel", { fg = t.kind, bg = t.selected })
    hl("PmenuExtra", { fg = t.extra, bg = t.bg })
    hl("PmenuExtraSel", { fg = t.extra_sel, bg = t.selected })
    hl("PmenuMatch", { fg = t.match, bg = t.bg, bold = true })
    hl("PmenuMatchSel", { fg = t.match, bg = t.selected, bold = true })
    hl("PmenuSbar", { bg = t.bg })
    hl("PmenuThumb", { bg = t.dim })
    hl("PmenuBorder", { fg = t.dim, bg = t.bg })

    -- base
    hl("Normal", { bg = t.bg })
    hl("NormalNC", { bg = t.bg })
    hl("SignColumn", { bg = t.bg })
    hl("NormalFloat", { bg = t.bg })
    hl("FloatBorder", { bg = t.bg })

    -- telescope
    hl("TelescopeNormal", { fg = t.bright, bg = t.bg })
    hl("TelescopeBorder", { fg = t.dim, bg = t.bg })
    hl("TelescopePromptNormal", { fg = t.bright, bg = t.prompt_bg })
    hl("TelescopePromptBorder", { fg = t.dim, bg = t.prompt_bg })
    hl("TelescopePromptTitle", { fg = t.bg, bg = t.dim })
    hl("TelescopePreviewTitle", { fg = t.dim, bg = t.bg })
    hl("TelescopeResultsTitle", { fg = t.bg, bg = t.bg })
    hl("TelescopeSelection", { fg = t.bright, bg = t.selected })
    hl("TelescopeMatching", { fg = t.bright, bold = true })

    -- nvim-notify
    local notify = {
        ERROR = t.bright,
        WARN = t.bright,
        INFO = t.bright,
        DEBUG = t.dim,
        TRACE = t.dim,
    }
    for level, fg in pairs(notify) do
        hl("Notify" .. level .. "Border", { fg = t.dim, bg = t.bg })
        hl("Notify" .. level .. "Icon", { fg = fg })
        hl("Notify" .. level .. "Title", { fg = fg })
        hl("Notify" .. level .. "Body", { fg = fg, bg = t.bg })
    end

    -- treesitter-context
    hl("TreesitterContext", { bg = t.prompt_bg })
    hl("TreesitterContextLineNumber", { fg = t.context_ln, bg = t.prompt_bg })
    hl("TreesitterContextBottom", { underline = true, sp = t.dim })

    -- oil
    hl("OilDirIcon", { fg = t.bright })
    hl("OilDir", { fg = t.bright })
end

-- Remember the current theme so it survives :colorscheme changes
local current = "black"

vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("custom_highlights", { clear = true }),
    callback = function() apply(themes[current]) end,
})

local function set_theme(name)
    current = name
    apply(themes[name])
end

-- Switcher
vim.keymap.set("n", "<leader>th", function()
    local names = vim.tbl_keys(themes)
    table.sort(names)
    vim.ui.select(names, { prompt = "Theme:" }, function(choice)
        if choice then set_theme(choice) end
    end)
end, { desc = "Pick theme" })

-- Apply default on startup
set_theme(current)
