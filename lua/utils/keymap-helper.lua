local M = {}

M.which_key_register = function()
    if M.which_key_queue then
        local wk_avail, wk = pcall(require, "which-key")
        if wk_avail then
            for mode, registration in pairs(M.which_key_queue) do
                local mappings = {}
                for keymap, opts in pairs(registration) do
                    if type(opts) == "table" then
                        local mapping = { keymap, mode = mode }
                        if opts[1] then
                            mapping[1] = keymap
                            mapping[2] = opts[1]
                        end
                        if opts.desc or opts.name then
                            mapping.desc = opts.desc or opts.name
                        end
                        if opts[2] and type(opts[2]) == "string" then
                            mapping.desc = opts[2]
                        end
                        table.insert(mappings, mapping)
                    end
                end
                if #mappings > 0 then
                    wk.add(mappings)
                end
            end
            M.which_key_queue = nil
        end
    end
end

M.empty_map_table = function()
    local maps = {}
    for _, mode in ipairs { "", "n", "v", "x", "s", "o", "!", "i", "l", "c", "t" } do
        maps[mode] = {}
    end
    return maps
end

M.set_mappings = function(map_table, base)
    base = base or {}
    for mode, maps in pairs(map_table) do
        for keymap, options in pairs(maps) do
            if options then
                local cmd = options
                local keymap_opts = base
                if type(options) == "table" then
                    cmd = options[1]
                    keymap_opts = vim.tbl_deep_extend("force", keymap_opts, options)
                    keymap_opts[1] = nil
                end

                if not M.which_key_queue then M.which_key_queue = {} end
                if not M.which_key_queue[mode] then M.which_key_queue[mode] = {} end

                if not cmd or keymap_opts.name then
                    if not keymap_opts.name then keymap_opts.name = keymap_opts.desc end
                    M.which_key_queue[mode][keymap] = keymap_opts
                else
                    vim.keymap.set(mode, keymap, cmd, keymap_opts)
                    M.which_key_queue[mode][keymap] = { cmd, keymap_opts.desc }
                end
            end
        end
    end
    if package.loaded["which-key"] then M.which_key_register() end
end

return M
