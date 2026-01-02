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
  -- layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top", --'bottom'
      -- mirror = true,
      width = 0.40,
      height = 0.70,
      preview_cutoff = 10000, -- When columns are less than this value, the preview will be disabled
    },
  },
  mappings = {
    i = {
      ["<C-s>"] = actions.select_horizontal,
      ["<Tab>"] = actions.move_selection_next,
    },
  },
}

local buffer_picker_options = {
  -- layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top", --'bottom'
      width = 0.40,
      height = 0.70,
      preview_cutoff = 10000, -- When columns are less than this value, the preview will be disabled
      -- preview_width = 0.40,
      -- results_width = 0.70,
    },
  },
  mappings = {
    i = {
      -- ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
      ["<c-d>"] = actions.delete_buffer,
      ["<C-s>"] = actions.select_horizontal,
      ["<Tab>"] = actions.move_selection_next,
    },
  },
}

local config = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim", -- add this value
    },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.45,
        results_width = 0.70,
      },
      vertical = {
        mirror = false,
      },
      width = 0.90,
      height = 0.80,
    },
    buffer_previewer_maker = new_maker,
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<esc>"] = actions.close,
      },
      i = {
        ["<C-s>"] = actions.select_horizontal,
        ["<Tab>"] = actions.move_selection_next,
      },
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
