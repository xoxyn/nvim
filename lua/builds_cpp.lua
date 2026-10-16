local M = {}

-- ── helpers ──────────────────────────────────────────────────
-- cmake-tools is cwd-based, so detect the same way
local function is_cmake_project()
    return vim.uv.fs_stat(vim.fn.getcwd() .. "/CMakeLists.txt") ~= nil
end

local function has_main(path)
    for _, line in ipairs(vim.fn.readfile(path)) do
        if line:match("%f[%w_]main%s*%(") then
            return true
        end
    end
    return false
end

-- ── scratch fallback (no CMakeLists.txt) ─────────────────────
local function run_scratch(ft, args)
    local file = vim.fn.expand("%:p")
    local dir = vim.fn.expand("%:p:h")
    local out = "/tmp/" .. vim.fn.expand("%:t:r")
    local ext = (ft == "cpp") and "cpp" or "c"

    local compiler, std = "gcc", "-std=c17"
    if ft == "cpp" then
        compiler, std = "g++", "-std=c++17"
    end

    -- current file first, then sibling sources that don't define main()
    local sources = { file }
    for _, f in ipairs(vim.fn.glob(dir .. "/*." .. ext, false, true)) do
        if f ~= file and not has_main(f) then
            table.insert(sources, f)
        end
    end

    local cmd = string.format(
        "%s %s -Wall -Wextra -Wpedantic -I%s -I%s -I%s %s -o %s && %s%s",
        compiler,
        std,
        vim.fn.shellescape(dir),
        vim.fn.shellescape(dir .. "/include"),
        vim.fn.shellescape(dir .. "/../include"),
        table.concat(vim.tbl_map(vim.fn.shellescape, sources), " "),
        vim.fn.shellescape(out),
        vim.fn.shellescape(out),
        args ~= "" and (" " .. args) or ""
    )
    vim.cmd("terminal " .. cmd)
end

-- ── dispatcher ───────────────────────────────────────────────
function M.run(with_args)
    local ft = vim.bo.filetype
    if not vim.tbl_contains({ "c", "cpp", "cmake" }, ft) then
        vim.notify("Not a C/C++ file", vim.log.levels.WARN)
        return
    end

    if is_cmake_project() then
        if with_args then
            -- opens an input popup; args are stored per launch target
            vim.cmd("CMakeLaunchArgs")
        else
            vim.cmd("CMakeRun") -- builds the launch target, then runs it
        end
    elseif ft ~= "cmake" then
        run_scratch(ft, with_args and vim.fn.input("Arguments: ") or "")
    end
end

-- ── keymaps ──────────────────────────────────────────────────
local map = vim.keymap.set

map("n", "<leader>r",  function() M.run(false) end, { desc = "Run C/C++ (CMake or scratch)" })
map("n", "<leader>rr", function() M.run(true) end,  { desc = "C/C++ run with args" })

-- CMake workflow under <leader>m
map("n", "<leader>mg", "<cmd>CMakeGenerate<cr>",              { desc = "CMake generate" })
map("n", "<leader>mb", "<cmd>CMakeBuild<cr>",                 { desc = "CMake build" })
map("n", "<leader>mc", "<cmd>CMakeClean<cr>",                 { desc = "CMake clean" })
map("n", "<leader>mt", "<cmd>CMakeSelectLaunchTarget<cr>",    { desc = "Pick run target" })
map("n", "<leader>mT", "<cmd>CMakeSelectBuildTarget<cr>",     { desc = "Pick build target" })
map("n", "<leader>mv", "<cmd>CMakeSelectBuildType<cr>",       { desc = "Pick build type" })
map("n", "<leader>mp", "<cmd>CMakeSelectConfigurePreset<cr>", { desc = "Pick configure preset" })
map("n", "<leader>mP", "<cmd>CMakeSelectBuildPreset<cr>",     { desc = "Pick build preset" })
map("n", "<leader>mf", "<cmd>CMakeRunCurrentFile<cr>",        { desc = "Run target of current file" })
map("n", "<leader>mF", "<cmd>CMakeBuildCurrentFile<cr>",      { desc = "Build target of current file" })
map("n", "<leader>mq", "<cmd>CMakeOpenExecutor<cr>",          { desc = "Open build output" })
map("n", "<leader>mx", "<cmd>CMakeStopExecutor<cr>",          { desc = "Stop build" })
map("n", "<leader>mX", "<cmd>CMakeStopRunner<cr>",            { desc = "Stop running program" })
map("n", "<leader>mr", "<cmd>CMakeRunTest<cr>",               { desc = "Run ctest" })
map("n", "<leader>mn", "<cmd>CMakeQuickStart<cr>",            { desc = "New CMake project template" })
map("n", "<leader>mo", "<cmd>CMakeOpenCache<cr>",             { desc = "Open CMakeCache.txt" })

return M
