-- Set theme ---
vim.opt.background = "dark"
vim.cmd("colorscheme peaksea")

-- Force background color (explicitly disabling any underline)
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { 
    bg = "#2a2d33",         -- Subtle dark background
    ctermbg = 236,          -- Fallback dark background
    underline = false,      -- Disables standard underline
    undercurl = false,      -- Disables curly underline
    sp = "NONE"             -- Clears special underline color if inherited
})

-- Set tabline ---
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Show commands
vim.opt.showcmd = true

-- Set highlight search
vim.opt.hlsearch = true

-- Set line number ---
-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.number = true

-- Status line ---
-- Always show the status line
vim.opt.laststatus = 3
