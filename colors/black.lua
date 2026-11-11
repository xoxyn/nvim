vim.cmd("hi clear")
vim.g.colors_name = "black"
vim.o.background = "dark"
vim.cmd("syntax off")

local colors = {
    black      = "#000000",
    white      = "#ffffff",
    light_gray = "#222222",
    gray       = "#555555",
}

local t = {
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
}

-- merges with the default colorscheme's values
local function hl(group, opts)
    local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", ok and current or {}, opts))
end

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

-- TODO: test

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
for level, fg in pairs({
    ERROR = t.bright, WARN = t.bright, INFO = t.bright,
    DEBUG = t.dim, TRACE = t.dim,
}) do
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
