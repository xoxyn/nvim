local c = { black = "#000000", white = "#ffffff", light_gray = "#222222", gray = "#555555" }
local bar = { bg = c.black, fg = c.white }
local b = { bg = c.light_gray, fg = c.white }

return {
    normal   = { a = { bg = c.white, fg = c.black, gui = "bold" }, b = b, c = bar },
    insert   = { a = { bg = c.light_gray, fg = c.white, gui = "bold" }, b = b, c = bar },
    visual   = { a = { bg = c.gray, fg = c.white, gui = "bold" }, b = b, c = bar },
    command  = { a = { bg = c.gray, fg = c.white, gui = "bold" }, b = b, c = bar },
    replace  = { a = { bg = c.black, fg = c.white, gui = "bold" }, b = b, c = bar },
    inactive = { a = { bg = c.black, fg = c.gray }, b = { bg = c.black, fg = c.gray }, c = { bg = c.black, fg = c.gray } },
}
