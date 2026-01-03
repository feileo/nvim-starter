-- 加载 nvchad 默认配置
local default_config = require "nvchad.configs.cmp"
local cmp = require "cmp"

-- 智能 Tab 键：优先 cmp，其次 luasnip，最后 supermaven
local function tab_complete(fallback)
    local suggestion = require("supermaven-nvim.completion_preview")

    -- 1. 如果 cmp 菜单可见，选择下一项
    if cmp.visible() then
        cmp.select_next_item()
        -- 2. 如果 luasnip 可以展开或跳转
    elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
        -- 3. 如果有 supermaven 建议，接受建议
    elseif suggestion.has_suggestion() then
        suggestion.on_accept_suggestion()
        -- 4. 否则使用默认 Tab 行为
    else
        fallback()
    end
end

-- 智能 Shift-Tab
local function shift_tab_complete(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
    else
        fallback()
    end
end

-- 覆盖 Tab 键配置
local config = {
    mapping = {
        ["<Tab>"] = cmp.mapping(tab_complete, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(shift_tab_complete, { "i", "s" }),
    },
}

return vim.tbl_deep_extend("force", default_config, config)
