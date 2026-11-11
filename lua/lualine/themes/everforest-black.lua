local c = {
    bg = "#000000", bg2 = "#171b19", bg3 = "#232a27", fg = "#d3c6aa", dim = "#6b7872",
    green = "#a7c080", blue = "#7fbbb3", purple = "#d699b6", red = "#e67e80", yellow = "#dbbc7f",
}
local b = { bg = c.bg3, fg = c.fg }
local bar = { bg = c.bg, fg = c.fg }
local function mode(color) return { a = { bg = color, fg = c.bg, gui = "bold" }, b = b, c = bar } end

return {
    normal   = mode(c.green),
    insert   = mode(c.blue),
    visual   = mode(c.purple),
    replace  = mode(c.red),
    command  = mode(c.yellow),
    inactive = { a = { bg = c.bg, fg = c.dim }, b = { bg = c.bg, fg = c.dim }, c = { bg = c.bg, fg = c.dim } },
}
