local default_config = require "nvchad.configs.telescope"

local actions = require "telescope.actions"
local previewers = require "telescope.previewers"
local putils = require "telescope.previewers.utils"
local pfiletype = require "plenary.filetype"

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then
    local ft = pfiletype.detect(filepath)
    -- Here for example you can say: if ft == "xyz" then this_regex_highlighing else nothing end
    opts.use_ft_detect = false
    putils.regex_highlighter(bufnr, ft)
  end
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

local file_picker_options = {
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top",
    },
    vertical = {
      mirror = false,
    },
    width = 0.38,
    height = 0.6,
    preview_cutoff = 1200000,
  },
}

local buffer_picker_options = {
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.40,
      results_width = 0.80,
    },
    vertical = {
      mirror = false,
    },
    width = 0.38,
    height = 0.6,
    preview_cutoff = 1200000,
  },
  mappings = {
    i = {
      ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
    },
  },
}

local config = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim", -- add this value
    },
    selection_caret = "",
    entry_prefix = "",
    buffer_previewer_maker = new_maker,
  },
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.40,
      results_width = 0.80,
    },
    vertical = {
      mirror = false,
    },
    width = 0.85,
    height = 0.60,
    preview_cutoff = 140,
  },
  mappings = {
    n = {
      ["q"] = actions.close,
      ["<esc>"] = actions.close,
    },
    i = {
      ["<esc>"] = actions.close,
    },
  },
  pickers = {
    find_files = file_picker_options,
    oldfiles = file_picker_options,
    buffers = buffer_picker_options,
    command_history = file_picker_options,
    current_buffer_tags = file_picker_options,
    projects = file_picker_options,
    symbols = file_picker_options,
    keymaps = { theme = "dropdown" },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        { winblend = 10 },
      },
    },
  },
}

return vim.tbl_deep_extend("force", default_config, config)
