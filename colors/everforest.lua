vim.cmd("hi clear")
vim.g.colors_name = "everforest"
vim.o.background = "dark"

local c = {
    bg     = "#000000",
    sel    = "#222222",
    fg     = "#d3c6aa",
    white  = "#ffffff",
    green  = "#a7c080",
    gray   = "#859289",
    light  = "#a7b0a3",
    orange = "#e69875",
    dim    = "#555555",
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor UI
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bg })
hi("FloatBorder",  { fg = c.dim, bg = c.bg })
hi("Cursor",       { fg = c.bg, bg = c.fg })
hi("CursorLine",   { bg = c.sel })
hi("CursorLineNr", { fg = c.white, bold = true })
hi("LineNr",       { fg = c.dim })
hi("SignColumn",   { fg = c.dim, bg = c.bg })
hi("ColorColumn",  { bg = c.sel })
hi("VertSplit",    { fg = c.dim, bg = c.bg })
hi("WinSeparator", { fg = c.dim, bg = c.bg })
hi("StatusLine",   { fg = c.fg, bg = c.sel })
hi("StatusLineNC", { fg = c.gray, bg = c.bg })
hi("Visual",       { bg = c.sel })
hi("Search",       { fg = c.bg, bg = c.green })
hi("IncSearch",    { fg = c.bg, bg = c.orange })
hi("MatchParen",   { fg = c.orange, bold = true, underline = true })
hi("NonText",      { fg = c.dim })
hi("EndOfBuffer",  { fg = c.bg })
hi("Folded",       { fg = c.gray, bg = c.sel, italic = true })
hi("Title",        { fg = c.green, bold = true })
hi("Directory",    { fg = c.green })
hi("ErrorMsg",     { fg = c.orange, bold = true })
hi("WarningMsg",   { fg = c.orange })
hi("MoreMsg",      { fg = c.green })
hi("Question",     { fg = c.green })

-- ── Completion menu
hi("Pmenu",         { fg = "#d3c6aa", bg = c.bg })
hi("PmenuSel",      { fg = "#ffffff", bg = c.sel, bold = true })
hi("PmenuKind",     { fg = "#a7c080", bg = c.bg })
hi("PmenuKindSel",  { fg = "#a7c080", bg = c.sel })
hi("PmenuExtra",    { fg = "#859289", bg = c.bg })
hi("PmenuExtraSel", { fg = "#a7b0a3", bg = c.sel })
hi("PmenuMatch",    { fg = "#e69875", bg = c.bg, bold = true })
hi("PmenuMatchSel", { fg = "#e69875", bg = c.sel, bold = true })
hi("PmenuSbar",     { bg = c.bg })
hi("PmenuThumb",    { bg = "#555555" })
hi("PmenuBorder",   { fg = "#555555", bg = c.bg })

-- ── Classic syntax groups
hi("Comment",     { fg = c.dim, italic = true })
hi("Keyword",     { fg = c.orange })
hi("Statement",   { fg = c.orange })
hi("Conditional", { fg = c.orange })
hi("Repeat",      { fg = c.orange })
hi("Exception",   { fg = c.orange })
hi("Label",       { fg = c.orange })
hi("Function",    { fg = c.white, bold = true })
hi("Type",        { fg = c.light, italic = true })
hi("Structure",   { fg = c.light, italic = true })
hi("Typedef",     { fg = c.light, italic = true })
hi("Identifier",  { fg = c.fg })
hi("Special",     { fg = c.orange, italic = true })
hi("PreProc",     { fg = c.gray })
hi("Include",     { fg = c.gray })
hi("Define",      { fg = c.gray })
hi("Macro",       { fg = c.gray, italic = true })
hi("String",      { fg = c.green })
hi("Constant",    { fg = c.orange })
hi("Number",      { fg = c.orange })
hi("Float",       { fg = c.orange })
hi("Boolean",     { fg = c.orange, bold = true })
hi("Operator",    { fg = c.gray })
hi("Delimiter",   { fg = c.gray })
hi("Error",       { fg = c.orange, bold = true, underline = true })
hi("Todo",        { fg = c.bg, bg = c.green, bold = true })
hi("Underlined",  { underline = true })

-- ── Treesitter
hi("@comment",               { fg = c.dim, italic = true })
hi("@comment.documentation", { fg = c.gray, italic = true })

hi("@keyword",          { fg = c.orange })
hi("@keyword.function", { fg = c.orange })
hi("@keyword.return",   { fg = c.orange, bold = true })
hi("@keyword.operator", { fg = c.orange })
hi("@keyword.import",   { fg = c.gray })
hi("@conditional",      { fg = c.orange })
hi("@repeat",           { fg = c.orange })
hi("@exception",        { fg = c.orange })
hi("@include",          { fg = c.gray })

hi("@function",         { fg = c.white, bold = true })
hi("@function.call",    { fg = c.fg })
hi("@function.builtin", { fg = c.orange, italic = true })
hi("@function.macro",   { fg = c.gray, italic = true })
hi("@method",           { fg = c.white, bold = true })
hi("@method.call",      { fg = c.fg })
hi("@constructor",      { fg = c.light, bold = true })

hi("@variable",           { fg = c.fg })
hi("@variable.builtin",   { fg = c.orange, italic = true })
hi("@variable.global",    { fg = c.light })
hi("@variable.parameter", { fg = c.light, italic = true })
hi("@variable.member",    { fg = c.fg, italic = true })

hi("@type",            { fg = c.light, italic = true })
hi("@type.builtin",    { fg = c.light, bold = true, italic = true })
hi("@type.definition", { fg = c.light, bold = true, italic = true })
hi("@attribute",       { fg = c.gray, italic = true })
hi("@namespace",       { fg = c.light })

hi("@string",         { fg = c.green })
hi("@string.escape",  { fg = c.orange, bold = true })
hi("@string.special", { fg = c.orange })
hi("@number",         { fg = c.orange })
hi("@float",          { fg = c.orange })
hi("@boolean",        { fg = c.orange, bold = true })

hi("@operator",              { fg = c.gray })
hi("@punctuation.bracket",   { fg = c.gray })
hi("@punctuation.delimiter", { fg = c.gray })
hi("@punctuation.special",   { fg = c.orange })

hi("@tag",           { fg = c.orange })
hi("@tag.attribute", { fg = c.light, italic = true })
hi("@tag.delimiter", { fg = c.gray })

-- ── LSP semantic tokens
hi("@lsp.type.function",   { fg = c.white, bold = true })
hi("@lsp.type.method",     { fg = c.white, bold = true })
hi("@lsp.type.keyword",    { fg = c.orange })
hi("@lsp.type.type",       { fg = c.light, italic = true })
hi("@lsp.type.class",      { fg = c.light, bold = true, italic = true })
hi("@lsp.type.interface",  { fg = c.light, italic = true })
hi("@lsp.type.variable",   { fg = c.fg })
hi("@lsp.type.parameter",  { fg = c.light, italic = true })
hi("@lsp.type.property",   { fg = c.fg, italic = true })
hi("@lsp.type.comment",    { fg = c.dim, italic = true })
hi("@lsp.type.string",     { fg = c.green })
hi("@lsp.type.number",     { fg = c.orange })
hi("@lsp.type.operator",   { fg = c.gray })
hi("@lsp.type.namespace",  { fg = c.light })
hi("@lsp.type.macro",      { fg = c.gray, italic = true })
hi("@lsp.type.enumMember", { fg = c.orange })
hi("@lsp.type.decorator",  { fg = c.gray, italic = true })
hi("@lsp.mod.readonly",    { underline = true })
hi("@lsp.mod.static",      { bold = true })
hi("@lsp.mod.deprecated",  { strikethrough = true, fg = c.dim })

-- ── Diagnostics
hi("DiagnosticError",          { fg = c.orange, bold = true })
hi("DiagnosticWarn",           { fg = c.orange })
hi("DiagnosticInfo",           { fg = c.light })
hi("DiagnosticHint",           { fg = c.gray })
hi("DiagnosticOk",             { fg = c.green })
hi("DiagnosticUnderlineError", { underline = true, sp = c.orange })
hi("DiagnosticUnderlineWarn",  { underline = true, sp = c.orange })
hi("DiagnosticUnderlineInfo",  { underline = true, sp = c.light })
hi("DiagnosticUnderlineHint",  { underline = true, sp = c.gray })

-- ── Git / diff
hi("GitSignsAdd",    { fg = c.green })
hi("GitSignsChange", { fg = c.light })
hi("GitSignsDelete", { fg = c.orange })
hi("DiffAdd",        { fg = c.green, bg = c.bg })
hi("DiffChange",     { fg = c.light, bg = c.bg })
hi("DiffDelete",     { fg = c.orange, bg = c.bg })
hi("DiffText",       { fg = c.white, bg = c.sel, bold = true })

-- ── Telescope
hi("TelescopeNormal",        { fg = c.white, bg = c.bg })
hi("TelescopeBorder",        { fg = c.dim, bg = c.bg })
hi("TelescopePromptNormal",  { fg = c.white, bg = c.sel })
hi("TelescopePromptBorder",  { fg = c.dim, bg = c.sel })
hi("TelescopePromptTitle",   { fg = c.bg, bg = c.green })
hi("TelescopePreviewTitle",  { fg = c.bg, bg = c.light })
hi("TelescopeResultsTitle",  { fg = c.bg, bg = c.bg })
hi("TelescopeSelection",     { fg = c.white, bg = c.sel })
hi("TelescopeMatching",      { fg = c.orange, bold = true })

-- ── nvim-notify
for level, fg in pairs({
    ERROR = c.orange, WARN = c.orange, INFO = c.green,
    DEBUG = c.dim, TRACE = c.dim,
}) do
    hi("Notify" .. level .. "Border", { fg = c.dim, bg = c.bg })
    hi("Notify" .. level .. "Icon",   { fg = fg })
    hi("Notify" .. level .. "Title",  { fg = fg })
    hi("Notify" .. level .. "Body",   { fg = c.fg, bg = c.bg })
end

-- ── treesitter-context
hi("TreesitterContext",           { bg = c.sel })
hi("TreesitterContextLineNumber", { fg = c.gray, bg = c.sel })
hi("TreesitterContextBottom",     { underline = true, sp = c.dim })

-- ── oil
hi("OilDirIcon", { fg = c.green })
hi("OilDir",     { fg = c.green })
