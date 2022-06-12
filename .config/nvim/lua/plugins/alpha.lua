local if_nil = vim.F.if_nil

local default_header = {
    type = "text",
    val = {
        [[ _____ ______   ________  ________  ___  ________  ___  ___     ]],
        [[|\   _ \  _   \|\   __  \|\   __  \|\  \|\   __  \|\  \|\  \    ]],
        [[\ \  \\\__\ \  \ \  \|\  \ \  \|\  \ \  \ \  \|\  \ \  \\\  \   ]],
        [[ \ \  \\|__| \  \ \  \\\  \ \   _  _\ \  \ \  \\\  \ \   __  \  ]],
        [[  \ \  \    \ \  \ \  \\\  \ \  \\  \\ \  \ \  \\\  \ \  \ \  \ ]],
        [[   \ \__\    \ \__\ \_______\ \__\\ _\\ \__\ \_______\ \__\ \__\]],
        [[    \|__|     \|__|\|_______|\|__|\|__|\|__|\|_______|\|__|\|__|]],
    },
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "Number",
    },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("e", "  New file", "<cmd>ene <CR>"),
        button("f", "  Find file", ":Telescope find_files <CR>"),
        button("r", "  Recently opened files", ":Telescope oldfiles <CR>"),
        button("g", "  Find word", ":Telescope live_grep <CR>"),
        button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
        button("p", "  Projects", ":e ~/Projects/ <CR>"),
        button("d", "  Documents", ":e ~/Documents/ <CR>"),
        button("q", "  Quit"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    header = default_header,
    buttons = buttons,
    footer = footer,
}

local config = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

return {
    button = button,
    section = section,
    config = config,
    -- theme config
    leader = leader,
    -- deprecated
    opts = config,
}
