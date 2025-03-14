-- Neovim options with defaults, explanations, and possible valuesoptions
local opt = vim.opt
local o = vim.o

-- Indentation & tabs
opt.shiftwidth = 2     -- Indent size for spaces
opt.tabstop = 4        -- Number of spaces for a tab
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Auto-indent new lines
opt.autoindent = true  -- Copy indent frm current line when start a new one
opt.softtabstop = 2    -- Insert mode: backspace over spaces

-- Line Numbers & Cursor
opt.number = true         -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers
opt.cursorline = true     -- Highlight the current line
opt.numberwidth = 1

-- Scrolling & Viewport
opt.scrolloff = 15     -- keep 8 lines above/below cursor
opt.sidescrolloff = 15 -- keep 8 columns to the left/right of the cursor
opt.signcolumn = "yes" -- always show the sign column
opt.colorcolumn = ""   -- show a vertical line at column 80
o.pumblend = 10
o.winblend = 10

-- Wrapping & Formatting
opt.wrap = false -- disable line wrapping
opt.linebreak = true -- wrap lines at word boundaries
opt.list = true -- show invisible characters
opt.listchars = { tab = "| ", trail = ".", nbsp = "␣" } -- Customize invisible characters

-- Splits & Windows
opt.splitright = true
opt.splitbelow = true

-- Performance & Behavior
-- opt.lazyredraw = true -- Redraw screen only when needed
opt.updatetime = 300    -- Faster UI update time
opt.timeoutlen = 500    -- Shorter timeout for mapped sequences
-- opt.ttimeoutlen = 10 -- Shorter timeout for key codes
opt.undofile = true     -- Persistent undo
opt.swapfile = false    -- Disable swapfile
opt.writebackup = false -- Disable backup before writing a file
opt.hidden = true       -- Allow switching buffers without saving

-- Search & Navigation
opt.ignorecase = true              -- Ignore case when searching
opt.smartcase = true               -- Override ignorecase if search contains uppercase
opt.incsearch = true               -- show search matches as you type
opt.hlsearch = true                -- Highlight search amtches
opt.wildmenu = true                -- Enable enhanced command line completion
opt.wildmode = "longest:full:full" -- More powerful completion

-- Clipboard & Mouse
opt.mouse = "a"               -- Enable mouse support in all modes
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Buffer Management
opt.switchbuf = "useopen,usetab" -- Open Buffers in existing windows / tabs
opt.fillchars = { eob = " " }    -- Remove `~` from empty lines in buffer
opt.confirm = true               -- Ask for confirmation when closing unsaved buffers

-- File Encoding & Formatting
opt.fileencoding = "utf-8" -- Default encoding

-- Command Line & Status
o.showmode = false                -- Don't show mode ( since status line plugins handle it)
o.cmdheight = 0                   -- Hides command-line unless needed
o.shortmess = o.shortmess .. "cI" -- Suppress completion & LSP messages

return opt
