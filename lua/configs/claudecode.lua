-- ============================================================================
-- Claude Code 配置
-- 文档: https://github.com/coder/claudecode.nvim
-- ============================================================================

local config = {
    -- 服务器配置
    port_range = { min = 10000, max = 65535 },
    auto_start = true,
    log_level = "info", -- "trace", "debug", "info", "warn", "error"

    auto_read_files = true,

    -- 终端命令 (默认: "claude")
    -- 如使用本地安装: "~/.claude/local/claude"
    terminal_cmd = nil,

    -- 发送后是否聚焦 Claude 终端
    focus_after_send = false,

    -- 选择跟踪
    track_selection = true,
    visual_demotion_delay_ms = 50,

    -- 终端配置
    terminal = {
        -- 使用 snacks.terminal (更加丝滑)
        provider = "snacks",  -- "auto", "snacks", "native", "external", "none"
        split_side = "right", -- "left" 或 "right"
        split_width_percentage = 0.3,
        auto_close = true,
        snacks_win_opts = {},
        provider_opts = {
            external_terminal_cmd = nil,
        },
    },

    -- Diff 配置
    diff_opts = {
        auto_close_on_accept = true,
        vertical_split = true,
        open_in_current_tab = true,
        keep_terminal_focus = false,
    },
}

return config
