-- Tree-sitter based highlight configuration

local M = {}

-- ============================================================================
-- 颜色定义 (Color Definitions)
-- ============================================================================
-- 基础色彩 (Base Colors)
local bg = "#23272E"            -- 背景
local dark_bg = "#282C34"       -- 深色背景
local cursorline_bg = "#2C323C" -- 光标行背景
local fg = "#ABB2BF"            -- 前景色/浅灰
local comment_gray = "#5C6370"  -- 注释灰

-- 主题色 (Theme Colors)
local blue = "#61AFEF"       -- 蓝色 - 函数
local green = "#98C379"      -- 绿色 - 字符串
local cyan = "#56B6C2"       -- 青色 - 特殊符号/方法
local purple = "#8D82F4"     -- 紫色 - 数字/布尔
local magenta = "#C678DD"    -- 品红 - 关键字
local yellow = "#E1BB76"     -- 黄色 - 类型
local red = "#FF4136"        -- 红色 - 错误
local orange_red = "#CF5345" -- 橙红 - 关键字操作符

-- 浅色变体 (Light Variants)
local light_blue = "#85AEC9"    -- 浅蓝 - 操作符/分隔符
local light_purple = "#BB9ED7"  -- 淡紫 - 控制流
local bright_blue = "#6190EE"   -- 亮蓝 - 内置类型
local bright_purple = "#8660F9" -- 亮紫 - 特殊字符

-- 中性色 (Neutral Colors)
local gray = "#999999"  -- 灰色 - 参数
local beige = "#ADAD97" -- 米色 - 属性/成员
local tan = "#C7AE95"   -- 棕褐 - 常量
local teal = "#94C7AD"  -- 青绿 - 模块/命名空间

-- 粉色系 (Pink Tones)
local pink = "#D689A6"     -- 粉色 - 操作符
local rose = "#E06D99"     -- 玫瑰粉 - 括号
local mauve = "#C795AE"    -- 粉紫 - 类型关键字
local hot_pink = "#e63995" -- 亮粉 - 协程

-- 蓝紫色系 (Blue-Purple Tones)
local blue_purple = "#7892E6" -- 蓝紫 - 方括号

-- 其他 (Others)
local rose_brown = "#A16D6D" -- 玫瑰棕 - 转义字符

-- ============================================================================
-- 扩展颜色定义 (Extended Color Definitions)
-- 整合自 highlights_.lua 的额外颜色，共 73 个独特颜色
-- ============================================================================

-- 蓝色系扩展 (Blues Extended)
local blue_sky = "#73AEEA"       -- 天蓝色
local blue_steel = "#83D7EC"     -- 钢蓝色 - 内置函数
local blue_soft = "#93BFCE"      -- 柔和蓝
local blue_type = "#87AFFF"      -- 类型蓝 - 内置类型（推荐）
local blue_pale = "#96B7F9"      -- 淡蓝色
local blue_deep = "#2792C3"      -- 深蓝色
local blue_teal = "#6EB4C0"      -- 蓝绿色
local blue_sky_light = "#87CEFA" -- 浅天蓝
local blue_sky_soft = "#89C3EB"  -- 柔和天蓝

-- 青色系扩展 (Cyans Extended)
local cyan_light = "#77C4C7"  -- 浅青色
local cyan_bright = "#00D7D7" -- 亮青色 - 非基础类型
local cyan_search = "#00AFD7" -- 搜索青
local cyan_teal = "#008080"   -- 深青色
local cyan_pale = "#C0DAFC"   -- 淡蓝色

-- 绿色系扩展 (Greens Extended)
local green_light = "#A1C180" -- 浅绿色
local green_pale = "#83B463"  -- 淡绿色 - 预处理器
local green_mint = "#AFD7AF"  -- 薄荷绿

-- 黄色系扩展 (Yellows Extended)
local yellow_main = "#E5C07B"   -- 主黄色 - 类型定义
local yellow_orange = "#E69966" -- 橙黄色
local yellow_pale = "#E0C085"   -- 淡黄色

-- 橙色系扩展 (Oranges Extended)
local orange_brown = "#B15F4A"  -- 棕橙色
local orange_deep = "#CC5500"   -- 深橙色
local orange_bright = "#E87164" -- 亮橙色
local orange_coral = "#FF7F50"  -- 珊瑚色
local orange_vivid = "#FF8C00"  -- 鲜橙色

-- 红色系扩展 (Reds Extended)
local red = "#E06C75"             -- 主红色
local red_constant = "#BE5046"    -- 深红色 - 常量
local red_soft = "#D27277"        -- 柔和红 - 分隔符
local red_conditional = "#D37A86" -- 条件红
local red_pale = "#D78787"        -- 浅红色
local red_pink = "#DB7093"        -- 紫红色
local red_bright = "#DE3163"      -- 鲜红色
local red_param_alt = "#CE767D"   -- 粉红色
local red_salmon = "#F08080"      -- 鲑鱼红

-- 粉色系扩展 (Pinks Extended)
local pink_light = "#F3A4A2" -- 浅粉色 - 字符
local pink_pale = "#FFAFD7"  -- 淡粉色

-- 紫色系扩展 (Purples Extended)
local purple_main = "#977DD1"        -- 主紫色 - 数字/布尔
local purple_vivid = "#875FFF"       -- 鲜艳紫 - 特殊字符
local purple_pale = "#9D89C7"        -- 淡紫色
local purple_light = "#A38AD7"       -- 浅紫色
local purple_soft = "#AA98D0"        -- 柔和紫
local purple_const = "#AFA7FF"       -- 常量紫
local purple_bool = "#AFAFFF"        -- 布尔紫
local purple_gray = "#B09DB9"        -- 灰紫色
local purple_pink = "#B589CC"        -- 粉紫色
local purple_mauve_alt = "#B784A7"   -- 紫粉色
local purple_keyword_alt = "#BA8CFC" -- 关键字紫
local purple_medium = "#BB7CD7"      -- 中紫色
local purple_struct = "#C8A2C8"      -- 结构体紫
local purple_soft_alt = "#C9A0DC"    -- 柔和紫备选
local purple_pale_alt = "#E4BEFB"    -- 淡紫备选

-- 灰色系扩展 (Grays Extended)
local gray_darkest = "#262626" -- 深灰色 - 背景
local gray_darker = "#31353F"  -- 暗灰色 - 光标行
local gray_dark = "#575C63"    -- 深灰色 - 特殊操作符
local gray_medium = "#767676"  -- 中灰色 - 可变参数
local gray_light = "#B2B2B2"   -- 浅灰色 - 操作符
local gray_silver = "#C0C0C0"  -- 银灰色
local gray_pale = "#D0D0D0"    -- 淡灰色

-- 米色/棕色系扩展 (Beiges/Browns Extended)
local beige_olive = "#AFAF87" -- 橄榄米 - 标识符
local beige_gray = "#BDAEAE"  -- 灰褐色

---@type Base46HLGroupsList
M.override = {
    ----------------------------------------------------------------------------------------------------
    ------------------------- 传统语法高亮 (Legacy Syntax - 兼容性) ------------------------------------
    ----------------------------------------------------------------------------------------------------
    Search = { fg = dark_bg, bg = blue },
    CursorLine = { bg = cursorline_bg },

    String = { fg = green },
    Character = { fg = green },
    Number = { fg = purple },
    Boolean = { fg = purple },
    Type = { fg = yellow },
    -- Structure = {},
    -- StorageClass = {},
    Identifier = { fg = fg },
    Constant = { fg = tan },
    PreProc = { fg = magenta },
    -- PreCondit = {},
    -- Include = {},
    Keyword = { fg = magenta },
    -- Define = {},
    -- Typedef = {},
    -- Exception = {},
    Conditional = { fg = light_purple },
    Repeat = { fg = light_purple },
    Statement = { fg = magenta },
    -- Macro = {},
    -- Error = {},
    -- Label = { fg = fg_label },
    Special = { fg = cyan },
    SpecialChar = { fg = bright_purple },
    Function = { fg = blue },
    Operator = { fg = light_blue },
    -- Title = {},
    -- Tag = {},
    Delimiter = { fg = fg },
    Comment = { fg = comment_gray, italic = true },
    SpecialComment = { italic = true },
    -- Todo = {},

    ------------------------------------------------ plugins -----------------------------------------------
    -- NvimTree
    NvimTreeOpenedFolderName = { fg = nil, bold = false },

    -- -- Telescope
    TelescopeMatching = { fg = blue, bold = true },

    ----------------------------------------------------------------------------------------------------------
    ------------------------- Tree-sitter 语义高亮 (Tree-sitter Semantic Highlights) -------------------------
    ---------------- :h treesitter-highlight-groups or https://neovim.io/doc/user/treesitter.html
    ----------------------------------------------------------------------------------------------------------
    -- 变量 (Variables)
    ["@variable"] = { fg = fg },
    ["@variable.parameter"] = { fg = gray },
    ["@variable.parameter.builtin"] = { fg = gray },
    ["@variable.builtin"] = { italic = true },
    ["@variable.member"] = { fg = beige },

    -- 常量 (Constants)
    ["@constant"] = { fg = tan },
    ["@constant.macro"] = { fg = tan },
    ["@constant.builtin"] = { fg = purple },

    -- 命名空间/模块/包 (Namespaces/Modules/Packages)
    ["@module"] = { fg = teal },
    ["@module.builtin"] = { fg = teal },
    ["@namespace"] = { fg = teal },

    -- 标签 (Labels)
    ["@label"] = { fg = light_purple },

    -- 字符串 (Strings)
    ["@string"] = { fg = green },
    ["@string.documentation"] = { fg = comment_gray },
    ["@string.regexp"] = { fg = bright_purple },
    ["@string.escape"] = { fg = rose_brown },
    ["@string.special"] = { fg = bright_purple },
    ["@string.special.symbol"] = { fg = bright_purple },
    -- ["@string.special.path"] = {},
    -- ["@string.special.url"] = {},

    -- 字符 (Characters)
    ["@character"] = { fg = green },
    ["@character.special"] = { fg = bright_purple },

    -- 数字和布尔值 (Numbers and Booleans)
    ["@number"] = { fg = purple_main },
    ["@number.float"] = { fg = purple },
    ["@boolean"] = { fg = purple_main },

    -- 类型 (Types)
    ["@type"] = { fg = yellow },
    ["@type.builtin"] = { fg = bright_blue },
    ["@type.definition"] = { fg = yellow },

    -- 属性/字段 (Properties/Fields)
    ["@attribute"] = { fg = beige },
    ["@attribute.builtin"] = { fg = blue_type },
    ["@property"] = { fg = beige },

    -- 函数 (Functions)
    ["@function"] = { fg = blue },
    ["@function.call"] = { fg = blue },
    ["@function.builtin"] = { fg = blue },
    ["@function.method"] = { fg = cyan },
    ["@function.method.call"] = { fg = cyan },
    ["@function.macro"] = { fg = magenta },

    -- 操作符 (Operators)
    ["@operator"] = { fg = red },

    -- 构造器 (Constructors)
    ["@constructor"] = { fg = yellow },

    -- 关键字 (Keywords)
    ["@keyword"] = { fg = magenta },
    ["@keyword.function"] = { fg = magenta },
    ["@keyword.import"] = { fg = magenta },
    ["@keyword.modifier"] = { fg = magenta },
    ["@keyword.coroutine"] = { fg = hot_pink },
    ["@keyword.type"] = { fg = mauve },
    ["@keyword.operator"] = { fg = orange_red },
    ["@keyword.repeat"] = { fg = light_purple },
    ["@keyword.return"] = { fg = light_purple },
    ["@keyword.debug"] = { fg = light_purple },
    ["@keyword.exception"] = { fg = light_purple },

    ["@keyword.directive"] = { fg = light_purple },
    ["@keyword.conditional.ternary"] = { fg = light_purple },

    ["@keyword.conditional"] = { fg = light_purple },
    ["@keyword.directive.define"] = { fg = light_purple },

    -- 标点符号 (Punctuation)
    ["@punctuation.delimiter"] = { fg = light_blue },
    ["@punctuation.bracket"] = { fg = rose },
    ["@punctuation.special"] = { fg = bright_purple },

    -- 注释 (Comments)
    ["@comment"] = { fg = comment_gray, italic = true },
    ["@comment.documentation"] = { fg = comment_gray, italic = true },
    -- ["@comment.error"] = {},
    -- ["@comment.warning"] = {},
    -- ["@comment.todo"] = {},
    -- ["@comment.note"] = {},

    -- ["@markup.strong"] = { bold = true },
    -- ["@markup.italic"] = { italic = true },
    -- ["@markup.strikethrough"] = { strikethrough = true },
    -- ["@markup.underline"] = { underline = true },

    -- ["@markup.heading"] = {},
    -- ["@markup.heading.1"] = {},
    -- ["@markup.heading.2"] = {},
    -- ["@markup.heading.3"] = {},
    -- ["@markup.heading.4"] = {},
    -- ["@markup.heading.5"] = {},
    -- ["@markup.heading.6"] = {},

    -- ["@markup.quote"] = {},
    -- ["@markup.math"] = {},

    -- ["@markup.link"] = {},
    -- ["@markup.link.label"] = {},
    -- ["@markup.link.url"] = {},

    -- ["@markup.raw"] = {},
    -- ["@markup.raw.block"] = {},

    -- ["@markup.list"] = {},
    -- ["@markup.list.checked"] = {},
    -- ["@markup.list.unchecked"] = {},

    -- ["@diff.plus"] = {},
    -- ["@diff.minus"] = {},
    -- ["@diff.delta"] = {},

    -- ["@tag"] = {},
    -- ["@tag.builtin"] = {},
    -- ["@tag.attribute"] = {},
    -- ["@tag.delimiter"] = {},

    -- ------------------------- Go 语言特定高亮 (Go-specific Highlights) -------------------------

    -- -- Go 变量 (Variables)
    -- ["@variable.go"] = { fg = fg },
    -- ["@variable.parameter.go"] = { fg = gray },
    -- ["@variable.member.go"] = { fg = beige },

    -- -- Go Receiver (接收器 - 方法的接收者)
    -- ["@variable.parameter.receiver.go"] = { fg = yellow, italic = true },

    -- -- Go 常量 (Constants)
    -- ["@constant.go"] = { fg = tan },
    -- ["@constant.builtin.go"] = { fg = purple }, -- nil, true, false, iota
    -- ["@number.go"] = { fg = purple },
    -- ["@boolean.go"] = { fg = purple },

    -- -- Go 字符串 (Strings)
    -- ["@string.go"] = { fg = green },
    -- ["@string.escape.go"] = { fg = rose_brown },
    -- ["@string.special.go"] = { fg = bright_purple }, -- 格式化占位符 %s, %d 等
    -- ["@character.go"] = { fg = green },

    -- -- Go 注释 (Comments)
    -- ["@comment.go"] = { fg = comment_gray, italic = true },
    -- ["@comment.documentation.go"] = { fg = comment_gray, italic = true },

    -- -- Go 类型 (Types)
    -- ["@type.go"] = { fg = yellow },
    -- ["@type.builtin.go"] = { fg = bright_blue }, -- int, string, bool, byte, rune, error 等
    -- ["@type.definition.go"] = { fg = yellow },

    -- -- Go 函数 (Functions)
    -- ["@function.go"] = { fg = blue },
    -- ["@function.builtin.go"] = { fg = cyan }, -- make, len, cap, append, copy 等
    -- ["@function.call.go"] = { fg = blue },
    -- ["@function.method.go"] = { fg = cyan },
    -- ["@function.method.call.go"] = { fg = cyan },

    -- -- Go 关键字 (Keywords)
    -- ["@keyword.go"] = { fg = magenta },
    -- ["@keyword.function.go"] = { fg = magenta },         -- func
    -- ["@keyword.return.go"] = { fg = light_purple },      -- return
    -- ["@keyword.conditional.go"] = { fg = light_purple }, -- if, else, switch, case, default
    -- ["@keyword.repeat.go"] = { fg = light_purple },      -- for, range
    -- ["@keyword.import.go"] = { fg = magenta },           -- import, package
    -- ["@keyword.type.go"] = { fg = mauve },               -- struct, interface, type
    -- ["@keyword.operator.go"] = { fg = orange_red },      -- 指针操作符 *, &

    -- -- Go 控制流 (Control Flow)
    -- ["@keyword.control.go"] = { fg = light_purple }, -- go, defer, select, break, continue

    -- -- Go 操作符 (Operators)
    -- ["@operator.go"] = { fg = light_blue }, -- +, -, *, /, %, ==, !=, <, >, <=, >=, &&, ||

    -- -- Go 标点符号 (Punctuation)
    -- ["@punctuation.delimiter.go"] = { fg = fg }, -- . , ; :
    -- ["@punctuation.bracket.go"] = { fg = rose },   -- 默认大括号颜色
    -- ["@punctuation.special.go"] = { fg = fg },   -- ...

    -- -- Go 大括号 (Curly Brackets) - 结构体、函数体
    -- ["@punctuation.bracket.curly.go"] = { fg = rose },

    -- -- Go 圆括号 (Round Brackets) - 函数调用、参数列表
    -- ["@punctuation.bracket.round.go"] = { fg = pink },

    -- -- Go 方括号 (Square Brackets) - 数组、切片
    -- ["@punctuation.bracket.square.go"] = { fg = yellow_main },

    -- -- Go 包名/命名空间 (Packages/Namespaces)
    -- ["@namespace.go"] = { fg = teal },
    -- ["@module.go"] = { fg = teal },

    -- -- Go 内置类型别名 (Built-in Type Aliases)
    -- ["@type.builtin.any.go"] = { fg = bright_blue },  -- any
    -- ["@type.builtin.map.go"] = { fg = bright_blue },  -- map
    -- ["@type.builtin.chan.go"] = { fg = bright_blue }, -- chan

    -- -- Go 结构体标签 (Struct Tags)
    -- ["@tag.go"] = { fg = green },
    -- ["@tag.attribute.go"] = { fg = green },

    -- -- Go 错误标记 (Invalid/Illegal)
    -- -- ["@error.go"] = { fg = red, underline = true },

    ----------------------------------------------------------------------------------------------------------
    ------------------------- LSP 语义高亮 (LSP Semantic Highlights) --------------------------------------
    ----------------------------------------------------------------------------------------------------------
    -- 注意: Cursor 配置中 "gopls.ui.semanticTokens": true
    -- 但在 Neovim 中建议禁用 LSP 语义高亮，以便完全使用 Tree-sitter

    -- ["@lsp.type.namespace"] = { link = "@namespace" },
    -- ["@lsp.type.type"] = { link = "@type" },
    -- ["@lsp.type.class"] = { link = "@type" },
    -- ["@lsp.type.enum"] = { link = "@type" },
    -- ["@lsp.type.interface"] = { link = "@type" },
    -- ["@lsp.type.struct"] = { link = "@type" },
    -- ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    -- ["@lsp.type.variable"] = { link = "@variable" },
    -- ["@lsp.type.property"] = { link = "@property" },
    -- ["@lsp.type.enumMember"] = { link = "@constant" },
    -- ["@lsp.type.function"] = { link = "@function" },
    -- ["@lsp.type.method"] = { link = "@function.method" },
    -- ["@lsp.type.macro"] = { link = "@function.macro" },
    -- ["@lsp.type.decorator"] = { link = "@function" },

    -- -- Go LSP 特定
    -- ["@lsp.type.namespace.go"] = { link = "@namespace.go" },
    -- ["@lsp.type.type.go"] = { link = "@type.go" },
    -- ["@lsp.type.struct.go"] = { link = "@type.go" },
    -- ["@lsp.type.interface.go"] = { link = "@type.go" },
    -- ["@lsp.type.parameter.go"] = { link = "@variable.parameter.go" },
    -- ["@lsp.type.variable.go"] = { link = "@variable.go" },
    -- ["@lsp.type.property.go"] = { link = "@variable.member.go" },
    -- ["@lsp.type.function.go"] = { link = "@function.go" },
    -- ["@lsp.type.method.go"] = { link = "@function.method.go" },
}

---@type HLTable
M.add = {
    ----------------------------------------------------------------------------------------------------------------
    ------------------------- vim 语法高亮组 (vim Syntax Highlight Groups - 补充 Tree-sitter) --------------------
    ----------------------------------------------------------------------------------------------------------------
    goStringFormat = { fg = bright_purple }, -- %s %d %v %+v 等 - 亮紫色
    goStringEscape = { fg = rose_brown },    -- \n \t \" 等转义字符 - 玫瑰棕
}

return M
