require('plugins')
vim.g.mapleader = ","

-- load legacy options
vim.cmd([[
so ~/.config/nvim/legacy.vim
]])

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.cmd([[set tabstop=4]])
vim.cmd([[set shiftwidth=4]])
vim.cmd([[set expandtab]])


require('mylsp')
require('nvimcmp')

require('symbols-outline').setup()

-- lsp_signature.nvim
require "lsp_signature".setup({
  hint_prefix = "",
  floating_window = false,
  bind = true,
})

local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup({
  enable_cmds = false,
  replace_netrw = false,
  keybinds = {
    ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
    ["oh"] = ranger_nvim.OPEN_MODE.split,
    ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
    ["or"] = ranger_nvim.OPEN_MODE.rifle,
  },
  ui = {
    border = "none",
    height = 1,
    width = 1,
    x = 0.5,
    y = 0.5,
  }
})


 -- define function and formatting of the information
local function parrot_status()
    local status_info = require("parrot.config").get_status_info()
    local status = ""
    if status_info.is_chat then
      status = status_info.prov.chat.name
    else
      status = status_info.prov.command.name
    end
    return string.format("%s(%s)", status, status_info.model)
end



-- lualine
require('lualine').setup{
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      'filename',
      function()
        return vim.fn['nvim_treesitter#statusline'](180)
      end},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = { parrot_status },
    lualine_z = {'location'},
}
}



-- nvim-treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}

require('nvim-autopairs').setup {}
vim.cmd([[
set colorcolumn=
]])

require("parrot").setup {
	providers = {
		openai = {
			api_key = os.getenv "OPENAI_API_KEY"
		}
	},
    	hooks = {
    	Complete = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{filecontent}}
          ```

          Please look at the following section specifically:
          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted.
          ]]
          local model_obj = prt.get_model()
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        Consult = function(prt, params)
        local chat_prompt = [[
          Your task is to analyze the provided {{filetype}} code and suggest
          improvements to optimize its performance. Identify areas where the
          code can be made more efficient, faster, or less resource-intensive.
          Provide specific suggestions for optimization, along with explanations
          of how these changes can enhance the code's performance. The optimized
          code should maintain the same functionality as the original code while
          demonstrating improved efficiency.

          Here is the code
          ```{{filetype}}
          {{filecontent}}
          ```
        ]]
        prt.ChatNew(params, chat_prompt)
      end,
      Ask = function(parrot, params)
        local template = [[
          In light of your existing knowledge base, please generate a response that
          is succinct and directly addresses the question posed. Prioritize accuracy
          and relevance in your answer, drawing upon the most recent information
          available to you. Aim to deliver your response in a concise manner,
          focusing on the essence of the inquiry.

          Here is the code from the current file the User is workingon. It might provide you important context :
          ```{{filetype}}
          {{filecontent}}
          ```

          Question: {{command}}
        ]]
        local model_obj = parrot.get_model("command")
        parrot.logger.info("Asking model: " .. model_obj.name)
        parrot.Prompt(params, parrot.ui.Target.popup, model_obj, "🤖 Ask ~ ", template)
      end,
    }
}



