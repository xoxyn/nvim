-- Everforest Black: pure-black Everforest with real semantic colors.
-- Save as colors/everforest-black.lua  ->  :colorscheme everforest-black
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "everforest-black"
vim.o.background = "dark"
vim.o.termguicolors = true

local c = {
    bg      = "#000000",
    bg1     = "#0e1110", -- floats, statusline
    bg2     = "#171b19", -- cursorline, context
    bg3     = "#232a27", -- selection / visual
    border  = "#3a4440",
    dim     = "#6b7872", -- comments (readable on black)
    gray    = "#859289",
    light   = "#a7b0a3",
    fg      = "#d3c6aa",
    white   = "#f2ecda",
    red     = "#e67e80",
    orange  = "#e69875",
    yellow  = "#dbbc7f",
    green   = "#a7c080",
    aqua    = "#83c092",
    blue    = "#7fbbb3",
    purple  = "#d699b6",
    -- tinted backgrounds for diffs / diagnostics
    bg_red    = "#2a1517",
    bg_green  = "#16200f",
    bg_blue   = "#0f2024",
    bg_yellow = "#241e0f",
}

local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end
local function link(from, to) vim.api.nvim_set_hl(0, from, { link = to, default = false }) end

-- ── Editor UI
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bg1 })
hi("FloatBorder",  { fg = c.border, bg = c.bg1 })
hi("FloatTitle",   { fg = c.green, bg = c.bg1, bold = true })
hi("Cursor",       { fg = c.bg, bg = c.fg })
hi("lCursor",      { fg = c.bg, bg = c.fg })
hi("TermCursor",   { fg = c.bg, bg = c.fg })
hi("CursorLine",   { bg = c.bg2 })
hi("CursorColumn", { bg = c.bg2 })
hi("CursorLineNr", { fg = c.yellow, bold = true })
hi("LineNr",       { fg = c.dim })
hi("LineNrAbove",  { fg = c.dim })
hi("LineNrBelow",  { fg = c.dim })
hi("SignColumn",   { fg = c.dim, bg = c.bg })
hi("FoldColumn",   { fg = c.dim, bg = c.bg })
hi("ColorColumn",  { bg = c.bg2 })
hi("VertSplit",    { fg = c.border, bg = c.bg })
hi("WinSeparator", { fg = c.border, bg = c.bg })
hi("StatusLine",   { fg = c.fg, bg = c.bg1 })
hi("StatusLineNC", { fg = c.dim, bg = c.bg })
hi("WinBar",       { fg = c.fg, bg = c.bg, bold = true })
hi("WinBarNC",     { fg = c.dim, bg = c.bg })
hi("TabLine",      { fg = c.gray, bg = c.bg1 })
hi("TabLineSel",   { fg = c.white, bg = c.bg3, bold = true })
hi("TabLineFill",  { bg = c.bg1 })
hi("Visual",       { bg = c.bg3 })
hi("VisualNOS",    { bg = c.bg3 })
hi("Search",       { fg = c.bg, bg = c.yellow })
hi("CurSearch",    { fg = c.bg, bg = c.orange, bold = true })
hi("IncSearch",    { fg = c.bg, bg = c.orange, bold = true })
hi("Substitute",   { fg = c.bg, bg = c.red })
hi("MatchParen",   { fg = c.orange, bg = c.bg3, bold = true })
hi("NonText",      { fg = c.border })
hi("Whitespace",   { fg = c.border })
hi("SpecialKey",   { fg = c.border })
hi("EndOfBuffer",  { fg = c.bg })
hi("Folded",       { fg = c.gray, bg = c.bg2, italic = true })
hi("Conceal",      { fg = c.dim })
hi("Title",        { fg = c.green, bold = true })
hi("Directory",    { fg = c.blue })
hi("ErrorMsg",     { fg = c.red, bold = true })
hi("WarningMsg",   { fg = c.yellow })
hi("ModeMsg",      { fg = c.fg, bold = true })
hi("MoreMsg",      { fg = c.green })
hi("Question",     { fg = c.green })
hi("WildMenu",     { fg = c.bg, bg = c.green })
hi("QuickFixLine", { bg = c.bg3, bold = true })
hi("SpellBad",     { undercurl = true, sp = c.red })
hi("SpellCap",     { undercurl = true, sp = c.yellow })
hi("SpellLocal",   { undercurl = true, sp = c.blue })
hi("SpellRare",    { undercurl = true, sp = c.purple })

-- ── Completion menu
hi("Pmenu",         { fg = c.fg, bg = c.bg1 })
hi("PmenuSel",      { fg = c.white, bg = c.bg3, bold = true })
hi("PmenuKind",     { fg = c.aqua, bg = c.bg1 })
hi("PmenuKindSel",  { fg = c.aqua, bg = c.bg3 })
hi("PmenuExtra",    { fg = c.gray, bg = c.bg1 })
hi("PmenuExtraSel", { fg = c.light, bg = c.bg3 })
hi("PmenuMatch",    { fg = c.orange, bg = c.bg1, bold = true })
hi("PmenuMatchSel", { fg = c.orange, bg = c.bg3, bold = true })
hi("PmenuSbar",     { bg = c.bg1 })
hi("PmenuThumb",    { bg = c.border })
hi("PmenuBorder",   { fg = c.border, bg = c.bg1 })

-- ── Classic syntax groups
hi("Comment",     { fg = c.dim, italic = true })
hi("Constant",    { fg = c.purple })
hi("String",      { fg = c.green })
hi("Character",   { fg = c.green })
hi("Number",      { fg = c.purple })
hi("Float",       { fg = c.purple })
hi("Boolean",     { fg = c.purple, bold = true })
hi("Identifier",  { fg = c.fg })
hi("Function",    { fg = c.white, bold = true })
hi("Statement",   { fg = c.orange })
hi("Conditional", { fg = c.orange })
hi("Repeat",      { fg = c.orange })
hi("Label",       { fg = c.orange })
hi("Operator",    { fg = c.gray })
hi("Keyword",     { fg = c.orange })
hi("Exception",   { fg = c.red })
hi("PreProc",     { fg = c.aqua })
hi("Include",     { fg = c.aqua })
hi("Define",      { fg = c.aqua })
hi("Macro",       { fg = c.aqua, italic = true })
hi("PreCondit",   { fg = c.aqua })
hi("Type",        { fg = c.yellow })
hi("StorageClass",{ fg = c.orange })
hi("Structure",   { fg = c.yellow })
hi("Typedef",     { fg = c.yellow })
hi("Special",     { fg = c.blue })
hi("SpecialChar", { fg = c.orange })
hi("Tag",         { fg = c.orange })
hi("Delimiter",   { fg = c.gray })
hi("SpecialComment", { fg = c.gray, italic = true })
hi("Debug",       { fg = c.red })
hi("Underlined",  { underline = true })
hi("Ignore",      { fg = c.dim })
hi("Error",       { fg = c.red, bold = true })
hi("Todo",        { fg = c.bg, bg = c.yellow, bold = true })
hi("Added",       { fg = c.green })
hi("Changed",     { fg = c.blue })
hi("Removed",     { fg = c.red })

-- TODO: Help

-- ── Treesitter
hi("@comment.documentation", { fg = c.gray, italic = true })
hi("@comment.todo",    { fg = c.bg, bg = c.yellow, bold = true })
hi("@comment.note",    { fg = c.bg, bg = c.blue, bold = true })
hi("@comment.warning", { fg = c.bg, bg = c.orange, bold = true })
hi("@comment.error",   { fg = c.bg, bg = c.red, bold = true })

hi("@keyword.return",    { fg = c.red, bold = true })
hi("@keyword.import",    { fg = c.aqua })
hi("@keyword.exception", { fg = c.red })
hi("@keyword.operator",  { fg = c.orange })
hi("@keyword.directive", { fg = c.aqua })

hi("@function",         { fg = c.white, bold = true })
hi("@function.call",    { fg = c.fg })
hi("@function.builtin", { fg = c.blue, italic = true })
hi("@function.macro",   { fg = c.aqua, italic = true })
hi("@function.method",      { fg = c.white, bold = true })
hi("@function.method.call", { fg = c.fg })
hi("@constructor",      { fg = c.yellow, bold = true })

hi("@variable",           { fg = c.fg })
hi("@variable.builtin",   { fg = c.purple, italic = true })
hi("@variable.parameter", { fg = c.light, italic = true })
hi("@variable.member",    { fg = c.light })
hi("@property",           { fg = c.light })

hi("@constant",         { fg = c.purple })
hi("@constant.builtin", { fg = c.purple, italic = true })
hi("@constant.macro",   { fg = c.aqua })

hi("@type",            { fg = c.yellow })
hi("@type.builtin",    { fg = c.yellow, italic = true })
hi("@type.definition", { fg = c.yellow, bold = true })
hi("@attribute",       { fg = c.aqua, italic = true })
hi("@module",          { fg = c.light })
hi("@label",           { fg = c.orange })

hi("@string",         { fg = c.green })
hi("@string.escape",  { fg = c.orange, bold = true })
hi("@string.special", { fg = c.orange })
hi("@string.regexp",  { fg = c.orange })
hi("@string.special.url", { fg = c.blue, underline = true })
hi("@number",         { fg = c.purple })
hi("@number.float",   { fg = c.purple })
hi("@boolean",        { fg = c.purple, bold = true })

hi("@operator",              { fg = c.gray })
hi("@punctuation.bracket",   { fg = c.gray })
hi("@punctuation.delimiter", { fg = c.gray })
hi("@punctuation.special",   { fg = c.orange })

hi("@tag",           { fg = c.orange })
hi("@tag.attribute", { fg = c.yellow, italic = true })
hi("@tag.delimiter", { fg = c.gray })

hi("@markup.heading",       { fg = c.green, bold = true })
hi("@markup.strong",        { bold = true })
hi("@markup.italic",        { italic = true })
hi("@markup.strikethrough", { strikethrough = true })
hi("@markup.underline",     { underline = true })
hi("@markup.link",          { fg = c.blue })
hi("@markup.link.url",      { fg = c.blue, underline = true })
hi("@markup.raw",           { fg = c.aqua })
hi("@markup.list",          { fg = c.orange })
hi("@diff.plus",            { fg = c.green })
hi("@diff.minus",           { fg = c.red })
hi("@diff.delta",           { fg = c.blue })

-- ── LSP semantic tokens
hi("@lsp.type.class",      { fg = c.yellow, bold = true })
hi("@lsp.type.enum",       { fg = c.yellow })
hi("@lsp.type.enumMember", { fg = c.purple })
hi("@lsp.type.interface",  { fg = c.yellow, italic = true })
hi("@lsp.type.parameter",  { fg = c.light, italic = true })
hi("@lsp.type.property",   { fg = c.light })
hi("@lsp.type.macro",      { fg = c.aqua, italic = true })
hi("@lsp.type.decorator",  { fg = c.aqua, italic = true })
hi("@lsp.type.comment",    {})  -- defer to treesitter
hi("@lsp.mod.readonly",    { underline = true })
hi("@lsp.mod.static",      { bold = true })
hi("@lsp.mod.deprecated",  { strikethrough = true, fg = c.dim })
hi("LspReferenceText",  { bg = c.bg3 })
hi("LspReferenceRead",  { bg = c.bg3 })
hi("LspReferenceWrite", { bg = c.bg3, underline = true })
hi("LspInlayHint",      { fg = c.dim, bg = c.bg2, italic = true })
hi("LspSignatureActiveParameter", { fg = c.orange, bold = true, underline = true })
hi("LspCodeLens",       { fg = c.dim, italic = true })

-- ── Diagnostics (each severity is now distinct)
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.yellow })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.aqua })
hi("DiagnosticOk",    { fg = c.green })
hi("DiagnosticVirtualTextError", { fg = c.red,    bg = c.bg_red })
hi("DiagnosticVirtualTextWarn",  { fg = c.yellow, bg = c.bg_yellow })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue,   bg = c.bg_blue })
hi("DiagnosticVirtualTextHint",  { fg = c.aqua,   bg = c.bg_green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.aqua })
hi("DiagnosticDeprecated",     { strikethrough = true, fg = c.dim })

-- ── Git / diff
hi("DiffAdd",     { bg = c.bg_green })
hi("DiffChange",  { bg = c.bg_blue })
hi("DiffDelete",  { fg = c.red, bg = c.bg_red })
hi("DiffText",    { bg = "#1d3a40", bold = true })
hi("GitSignsAdd",    { fg = c.green })
hi("GitSignsChange", { fg = c.blue })
hi("GitSignsDelete", { fg = c.red })
hi("GitSignsCurrentLineBlame", { fg = c.dim, italic = true })

-- ── Telescope
hi("TelescopeNormal",         { fg = c.fg, bg = c.bg1 })
hi("TelescopeBorder",         { fg = c.border, bg = c.bg1 })
hi("TelescopePromptNormal",   { fg = c.white, bg = c.bg2 })
hi("TelescopePromptBorder",   { fg = c.bg2, bg = c.bg2 })
hi("TelescopePromptTitle",    { fg = c.bg, bg = c.green, bold = true })
hi("TelescopePreviewTitle",   { fg = c.bg, bg = c.blue, bold = true })
hi("TelescopeResultsTitle",   { fg = c.bg1, bg = c.bg1 })
hi("TelescopeSelection",      { fg = c.white, bg = c.bg3 })
hi("TelescopeSelectionCaret", { fg = c.orange, bg = c.bg3 })
hi("TelescopeMatching",       { fg = c.orange, bold = true })

-- ── nvim-cmp / blink.cmp
hi("CmpItemAbbrMatch",      { fg = c.orange, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.orange, bold = true })
hi("CmpItemAbbrDeprecated", { fg = c.dim, strikethrough = true })
hi("CmpItemMenu",           { fg = c.gray })
hi("BlinkCmpMenu",          { fg = c.fg, bg = c.bg1 })
hi("BlinkCmpMenuBorder",    { fg = c.border, bg = c.bg1 })
hi("BlinkCmpMenuSelection", { bg = c.bg3, bold = true })
hi("BlinkCmpLabelMatch",    { fg = c.orange, bold = true })
hi("BlinkCmpLabelDeprecated", { fg = c.dim, strikethrough = true })
hi("BlinkCmpDoc",           { fg = c.fg, bg = c.bg1 })
hi("BlinkCmpDocBorder",     { fg = c.border, bg = c.bg1 })
local kinds = {
    Function = c.blue, Method = c.blue, Constructor = c.yellow,
    Class = c.yellow, Interface = c.yellow, Struct = c.yellow, Enum = c.yellow,
    Field = c.light, Property = c.light, Variable = c.fg,
    Keyword = c.orange, Constant = c.purple, EnumMember = c.purple,
    Module = c.aqua, Snippet = c.aqua, Text = c.gray, File = c.gray, Folder = c.blue,
}
for kind, fg in pairs(kinds) do
    hi("CmpItemKind" .. kind, { fg = fg })
    hi("BlinkCmpKind" .. kind, { fg = fg })
end

-- ── which-key, flash, indent-blankline, mini, lazy
hi("WhichKey",          { fg = c.orange })
hi("WhichKeyGroup",     { fg = c.blue })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.dim })
hi("WhichKeyNormal",    { bg = c.bg1 })
hi("FlashLabel",        { fg = c.bg, bg = c.orange, bold = true })
hi("FlashMatch",        { fg = c.fg, bg = c.bg3 })
hi("FlashCurrent",      { fg = c.bg, bg = c.yellow })
hi("FlashBackdrop",     { fg = c.dim })
hi("IblIndent",         { fg = c.bg3 })
hi("IblScope",          { fg = c.gray })
hi("MiniIndentscopeSymbol", { fg = c.gray })
hi("MiniStatuslineModeNormal",  { fg = c.bg, bg = c.green, bold = true })
hi("MiniStatuslineModeInsert",  { fg = c.bg, bg = c.blue, bold = true })
hi("MiniStatuslineModeVisual",  { fg = c.bg, bg = c.purple, bold = true })
hi("MiniStatuslineModeReplace", { fg = c.bg, bg = c.red, bold = true })
hi("MiniStatuslineModeCommand", { fg = c.bg, bg = c.yellow, bold = true })
hi("LazyH1",     { fg = c.bg, bg = c.green, bold = true })
hi("LazyButton", { bg = c.bg2 })
hi("LazyButtonActive", { fg = c.bg, bg = c.orange, bold = true })

-- ── nvim-notify
for level, fg in pairs({
    ERROR = c.red, WARN = c.yellow, INFO = c.green,
    DEBUG = c.dim, TRACE = c.purple,
}) do
    hi("Notify" .. level .. "Border", { fg = c.border, bg = c.bg1 })
    hi("Notify" .. level .. "Icon",   { fg = fg })
    hi("Notify" .. level .. "Title",  { fg = fg })
    hi("Notify" .. level .. "Body",   { fg = c.fg, bg = c.bg1 })
end

-- ── treesitter-context
hi("TreesitterContext",           { bg = c.bg2 })
hi("TreesitterContextLineNumber", { fg = c.gray, bg = c.bg2 })
hi("TreesitterContextBottom",     { underline = true, sp = c.border })

-- ── oil
hi("OilDir",     { fg = c.blue, bold = true })
hi("OilDirIcon", { fg = c.blue })
hi("OilLink",    { fg = c.aqua })
hi("OilFile",    { fg = c.fg })

-- ── Terminal palette
vim.g.terminal_color_0  = c.bg2
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.purple
vim.g.terminal_color_6  = c.aqua
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = c.dim
vim.g.terminal_color_9  = c.red
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.yellow
vim.g.terminal_color_12 = c.blue
vim.g.terminal_color_13 = c.purple
vim.g.terminal_color_14 = c.aqua
vim.g.terminal_color_15 = c.white
