-- Syntax
--
-- local cbule__ = "#73AEEA" -- #87AFFF -- #87CEFA -- #89C3EB -- #87AFFF -- #2792C3
local cbule__ = "#61AFEF"
local cpurple = "#BB7CD7" -- #E4BEFB -- #977DD1 -- #B589CC -- #C9A0DC -- #C8A2C8 -- #B09DB9 -- #B784A7
local spurple = "#875FFF"
local cyellow = "#E0C085"
local corange = "#E69966" -- #CC5500 -- #FF8C00 -- #FF7F50 --#F08080
local cred___ = "#D27277" -- #D37A86 -- #D78787 -- #DB7093
local cred__1 = "#DE3163"
local cgreen_ = "#A1C180" -- #83B463 -- #AFD7AF
local ccyan__ = "#77C4C7" -- #00d7d7 -- #6EB4C0 --#00D6FF
local cliblue = "#93BFCE"
local cligrey = "#C0DAFC"
local colive_ = "#AFAF87"
local cgrey__ = "#767676" -- #575C63 -- #999999
local csilver = "#B2B2B2" -- #C0C0C0 -- #D0D0D0
local cpink__ = "#F3A4A2" -- #FFAFD7
local teal___ = "#008080"

-- Other
local shacyan = "#00AFD7"
local cgrey15 = "#262626"
local cgrey16 = "#31353F"

-- Syntax
-- https://encycolorpedia.cn/afeeee
local fg_statement = "#c678dd"
local fg_keyword = "#c678dd"
local fg_keyword_2 = "#e63995"
local fg_keyword_3 = "#C8A2C8"
local fg_keyword_4 = "#C8A2C8"

local fg_type = "#E69966"           --"#E0C085" -- "#d19a66"
local fg_primitive_type = "#87AFFF" -- "#00d7ff"
local fg_nonprimitive_type = "#00d7d7"

local fg_function = "#61afef"
local fg_function_builtins = "#83D7EC" -- "#00d7ff" --"#F08080"

local fg_conditional = "#D37A86"
local fg_repeat = "#D37A86"      --"#e06c75"
local fg_delimiter = "#b2b2b2"
local fg_delimiter_2 = "#D27277" -- #DB7093
local fg_operator = "#b2b2b2"    --"#DB7093"
local fg_operator_sp = "#575C63"
local fg_operator_2 = "#767676"
local fg_operator_ptr = "#e63995" --"#DB7093"
local fg_identifier = "#AFAF87"
local fg_special = "#56b6c2"
local fg_string = "#98c379"
local fg_character = "#F3A4A2"
local fg_specialchar = "#875FFF"
local fg_number = "#977DD1" -- "#93BFCE"
local fg_boolean = "#977DD1"
local fg_constant = "#be5046"
local fg_param = "#999999"

local fg_preproc = "#83B463"
-- local fg_label = "#e5c07b"

local M = {}

---@type Base46HLGroupsList
M.override = {
  ------------------------- common -------------------------
  Search = { fg = cgrey15, bg = shacyan },
  CursorLine = { bg = cgrey16 },
  ------------------------- syntax -------------------------
  String = { fg = fg_string },
  Character = { fg = fg_character },
  Number = { fg = fg_number },
  -- Float = {},
  Boolean = { fg = fg_boolean },
  Type = { fg = fg_type },
  -- Structure = {},
  -- StorageClass = {},
  Identifier = { fg = fg_identifier },
  Constant = { fg = fg_constant },
  PreProc = { fg = fg_preproc },
  -- PreCondit = {},
  -- Include = {},
  Keyword = { fg = fg_keyword },
  -- Define = {},
  -- Typedef = {},
  -- Exception = {},
  Conditional = { fg = fg_conditional },
  Repeat = { fg = fg_repeat },
  Statement = { fg = fg_statement },
  -- Macro = {},
  -- Error = {},
  -- Label = { fg = fg_label },
  Special = { fg = fg_special },
  SpecialChar = { fg = fg_specialchar },
  Function = { fg = fg_function },
  Operator = { fg = fg_operator },
  -- Title = {},
  -- Tag = {},
  Delimiter = { fg = fg_delimiter_2 },
  -- Todo = {},
  Comment = { italic = true },
  SpecialComment = { italic = true },
  ------------------------- plugins -------------------------
  -- TelescopeMatching = { fg = "red" },
}

---@type HLTable
-- https://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
-- https://github.com/charlespascoe/vim-go-syntax/blob/main/syntax/go.vim
M.add = {
  ------ For Golang ------

  -- Fields
  -- goField = { fg = cgreen_ }, -- Identifier

  -- Labels
  goLabel = { fg = fg_delimiter_2 }, -- Label

  -- Operators
  goOperator = { fg = fg_operator_ptr }, -- Operator
  -- goAssign = {fg=""},

  -- Dot
  goDot = { fg = fg_operator }, -- Operator
  -- goDotExpr = { fg = "" },
  -- goDotComment = { fg = "" },

  -- Comma
  goComma = { fg = fg_operator }, -- Delimiter
  -- goCommaExpr= { fg = "" },

  -- Semicolon
  goSemicolon = { fg = fg_operator },     -- Delimiter
  goUnderscore = { fg = fg_operator_sp }, -- Special

  -- Simple Blocks
  goBraces = { fg = fg_delimiter_2 }, -- Delimiter
  goBrackets = { fg = fg_delimiter_2 },
  goParens = { fg = fg_delimiter_2 },

  -- comments
  -- goCommentTodo = { fg = "" }, -- Todo
  -- goComment = { fg = cgrey__  }, -- Comment
  -- goGenerateComment = { fg = "",  }, -- PreProc

  -- literals
  -- goString = { fg = cgreen_ }, -- String
  -- goStringEnds = { fg = cgreen_ },
  goStringEscape = { fg = cred__1 }, -- SpecialChar
  goStringFormat = { fg = spurple }, -- SpecialChar
  -- goRawString = { fg = cgreen_ },
  -- goRawStringEnds = {fg=cgreen_},

  -- goRuneLiteral = { fg =  }, -- Character
  -- goRuneLiteralEscape = { fg = "" },
  -- goInvalidRuneLiteral = { fg = "" }, -- Error

  -- goNumber = { fg =  }, -- Number
  -- goNumberType = { fg = "" }, -- SpecialChar
  -- goNumberError = { fg = "" }, -- Error
  -- goNumberDecimalExp = { fg = "" }, -- SpecialChar
  -- goNumberHexExp = { fg = "" }, -- SpecialChar
  -- goNumberSpecialChar = { fg = "" }, -- SpecialChar

  -- goBooleanTrue = { fg = "#afafff" }, -- Boolean
  -- goBooleanFalse = { fg = "#afafff" },
  goNil = { fg = fg_number }, -- Constant
  -- goIota = { fg = "#afa7ff" }, -- Special

  -- Constants and Variables
  -- goConstDecl = { fg = cbule__ }, -- Statement
  -- goVarDecl = { fg = cbule__ }, -- Statement

  goConstDeclParens = { fg = fg_delimiter_2 },
  goVarDeclParens = { fg = fg_delimiter_2 },

  -- goVarIdentifier = { fg = "" }, -- Identifier
  -- goVarGroupIdentifier = { fg = "" },
  -- goShortVarDecl = { fg = "" },
  -- goVarComma = { fg = "" }, -- Delimiter

  -- goVarAssign = { fg = "" }, --  Special

  -- Packages
  -- goPackage = { fg = cbule__ }, -- Keyword
  -- goImport = { fg = cbule__ }, -- Keyword
  -- goImportItem = { fg = "" },
  -- goImportString = { fg = "" },
  goImportParens = { fg = fg_delimiter_2 },

  -- Types
  goPointer = { fg = fg_operator_ptr }, -- Operator
  -- goTypeDecl = { fg = cbule__ }, -- Keyword
  goTypeParens = { fg = fg_delimiter_2 },
  goTypeDeclGroupParens = { fg = fg_delimiter_2 },
  -- goTypeDeclName = { fg = ccyan__ }, -- Type
  goTypeParamBrackets = { fg = fg_delimiter_2 },
  -- goTypeAssign = { fg = "" },

  -- goPackageName = { fg = "#56B6C2" }, -- Special

  goPrimitiveTypes = { fg = fg_primitive_type }, -- Type
  -- goNonPrimitiveType = { fg = fg_nonprimitive_type }, -- Type
  -- goMapType = { fg = "#00afff" },
  -- goMapLiteral = { fg = "" },
  goMapBrackets = { fg = fg_delimiter_2 },
  -- goSliceOrArrayLiteral = { fg = "" },
  -- goSliceOrArrayType = { fg = "" },
  goSliceBraces = { fg = fg_delimiter_2 },
  goMapBraces = { fg = fg_delimiter_2 },
  -- goChannelDir = { fg = "" },
  -- goChannel = { fg = ccyan__ }, -- Type

  -- goFuncDecl = { fg = cbule__ }, -- Keyword

  -- Functions
  -- goFuncType = { fg = ccyan__ }, -- Keyword

  -- goFuncName = { fg = cbule__ }, -- Function
  -- goFuncCall = { fg = "" }, -- Function
  goFuncCallParens = { fg = fg_delimiter_2 },
  -- goFuncLiteral = { fg = "" },
  goFuncParens = { fg = fg_delimiter_2 },
  -- goFuncBraces = { fg = "" },
  goFuncMultiReturnParens = { fg = fg_delimiter_2 },

  goReceiverParens = { fg = fg_delimiter_2 },

  goVariadic = { fg = fg_operator_2 },
  goArgSpread = { fg = fg_operator_2 },

  goParam = { fg = fg_param },     -- Identifier
  -- goParamComma = { fg = "" },
  goTypeParam = { fg = fg_param }, -- Identifier
  -- goTypeParamComma = { fg = "" },
  goFuncTypeParam = { fg = fg_param },

  -- goReturn = { fg = ccyan__ }, -- Statement
  goNamedReturnValue = { fg = fg_param }, -- None

  -- Structs and Interfaces
  goStructType = { fg = fg_keyword_3 }, -- Keyword
  goStructTypeBraces = { fg = fg_delimiter_2 },
  -- goStructTypeField = { fg = "" }, -- Identifier
  goStructTypeTag = { fg = fg_string }, -- PreProc
  -- goStructLiteral = { fg = "#d78787" }, -- Type
  -- goStructLiteralField = { fg = "" },
  -- goStructLiteralColon = { fg = "" },
  -- goStructLiteralComma = { fg = "" },
  goStructBraces = { fg = fg_delimiter_2 },

  goInterfaceType = { fg = fg_keyword_4 }, -- Keyword
  -- goTypeConstraintSymbols = { fg = "" },
  goInterfaceBraces = { fg = fg_delimiter_2 },
  -- goInterfaceMethod = { fg = "red" },  -- Function
  goInterfaceMethodParens = { fg = fg_delimiter_2 },

  -- Builtins
  goBuiltins = { fg = fg_function_builtins }, -- Special
  -- goMakeBuiltin = {fg=""},
  -- goNewBuiltin = {fg=""},

  -- Flow Control
  -- goIf = { fg =  },  -- Conditional
  -- goElse = { fg =  },

  goSwitch = { fg = fg_delimiter_2 }, -- Conditional
  -- goSelect = { fg =  },
  -- goCase = { fg =  },
  -- goSwitchKeywords = { fg =  },
  -- goSwitchTypeCase = { fg =  },

  -- goFor = { fg =  }, -- Repeat
  -- goForRange = { fg =  },
  -- goForKeywords = { fg =  },

  goSwitchTypeBraces = { fg = fg_delimiter_2 },

  -- Other
  goKeywords = { fg = fg_keyword_2 }, -- Keyword
  -- goTypeAssertion = { fg = "" }, -- Special

  -- godocUntyped = { fg = "" }, -- Type
  -- godocVarConst = { fg = "" },
  -- godocVarConstIdentifier = { fg = "" },
  -- godocFuncDecl = { fg = "" },
  -- godocReceiverParens = { fg =  },
  -- godocField = { fg = "" }, -- Keyword
  -- godocFieldIdentifier = { fg = "" }, -- Identifier
  -- godocMethodDot = { fg = "" },

  ------ For NvimTree ------
  -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
