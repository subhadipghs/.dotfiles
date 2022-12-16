local config = {

  -- NvChad Status bar replicate
  icons = {
    VimIcon = "",
    ScrollText = "",
    GitBranch = "",
    GitAdd = "",
    GitChange = "",
    GitDelete = "",
  },
  -- modify variables used by heirline but not defined in the setup call directly
  heirline = {
    -- define the separators between each section
    separators = {
      left = { "", " " }, -- separator for the left side of the statusline
      right = { " ", "" }, -- separator for the right side of the statusline
    },
    -- add new colors that can be used by heirline
    colors = function(hl)
      -- use helper function to get highlight group properties
      local comment_fg = astronvim.get_hlgroup("Comment").fg
      hl.git_branch_fg = comment_fg
      hl.git_added = comment_fg
      hl.git_changed = comment_fg
      hl.git_removed = comment_fg
      hl.blank_bg = astronvim.get_hlgroup("Folded").fg
      hl.file_info_bg = astronvim.get_hlgroup("Visual").bg
      hl.nav_icon_bg = astronvim.get_hlgroup("String").fg
      hl.folder_icon_bg = astronvim.get_hlgroup("Error").fg
      return hl
    end,
  },

  -- Set colorscheme
  colorscheme = "vscode",

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  -- Disable AstroVim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "pseewald/vim-anyfold" },
      { "patstockwell/vim-monokai-tasty" },
      { "catppuccin/nvim" },
      { "Mofiqul/vscode.nvim" },
      { "shaunsingh/moonlight.nvim" },
      -- { "mhartington/oceanic-next" },
      -- { "shaunsingh/nord.nvim" },
      { "rebelot/kanagawa.nvim" },
      { "jacoborus/tender.vim" },
      { "ellisonleao/gruvbox.nvim" },
      -- { "tomasiser/vim-code-dark" },
      { "voldikss/vim-floaterm" },
      -- { "cseelus/vim-colors-lucid" },
      -- { "marko-cerovac/material.nvim" },
      -- { "bluz71/vim-nightfly-guicolors" },
      -- { "ayu-theme/ayu-vim" },
      { "folke/tokyonight.nvim" },
      -- {
      --   "nvim-lualine/lualine.nvim",
      --   config = function()
      --     require('lualine').setup {
      --       options = {
      --         icons_enabled = true,
      --         theme = 'auto',
      --         component_separators = '|',
      --         -- section_separators = { left = '', right = '' },
      --         section_separators = { left = '', right = '' },
      --       },
      --       sections = {
      --         lualine_a = {
      --           -- { 'mode', separator = { left = '' }, right_padding = 2 },
      --           { 'mode', separator = { left = '' }, right_padding = 2 },
      --         },
      --         lualine_b = {
      --           'filename',
      --           {
      --             'branch',
      --             icon = { '' }
      --           },
      --           'diff',
      --           'diagnostics'
      --         },
      --         lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" },
      --         lualine_x = {},
      --         lualine_y = { 'filetype', 'progress' },
      --         lualine_z = {
      --           -- { 'location', separator = { right = '' }, left_padding = 2 },
      --           { 'location', separator = { right = '' }, left_padding = 2 },
      --         },
      --       },
      --       inactive_sections = {
      --         lualine_a = { 'filename' },
      --         lualine_b = {},
      --         lualine_c = {},
      --         lualine_x = {},
      --         lualine_y = {},
      --         lualine_z = { 'location' },
      --       },
      --       tabline = {},
      --     }
      --   end,
      -- },
      -- { "artanikin/vim-synthwave84" },
      -- { "ahmedabdulrahman/aylin.vim" },
      -- { "tomasr/molokai" },
      -- { "keitanakamura/neodark.vim" },
      [ "xiyaowong/nvim-transparent" ] = {
        config = function()
          require('transparent').setup {
            enable = false,
            extra_groups = { -- table/string: additional groups that should be cleared
              "BufferLineTabClose",
              "BufferlineBufferSelected",
              "BufferLineFill",
              "BufferLineBackground",
              "BufferLineSeparator",
              "BufferLineIndicatorSelected",
              "StatusLine",
              "Neotree"
            },
          }
        end
      },
      -- { "rhysd/vim-color-spring-night" },
      {
        "prettier/vim-prettier",
        ft = { 'javascriptreact', 'typescriptreact', 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml',
          'html' },
        run = 'yarn install --frozen-lockfile --production'
      },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },

    heirline = function(config)
      -- the first element of the configuration table is the statusline
      config[1] = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },
        -- each element following is a component in astronvim.status module

        -- add the vim mode component
        astronvim.status.component.mode {
          -- enable mode text with padding as well as an icon before it
          mode_text = { hl = { bold = true }, icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
          -- define the highlight color for the text
          hl = { fg = "bg" },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            -- set the color of the surrounding based on the current mode using astronvim.status module
            color = function() return { main = astronvim.status.hl.mode_bg(), right = "blank_bg" } end,
          },
        },
        -- we want an empty space here so we can use the component builder to make a new section with just an empty string
        astronvim.status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = { separator = "left", color = { main = "blank_bg", right = "file_info_bg" } },
        },
        -- add a section for the currently opened file information
        astronvim.status.component.file_info {
          -- enable the file_icon and disable the highlighting based on filetype
          file_icon = { hl = false, padding = { left = 0 } },
          filename = { fallback = "Empty" },
          -- add padding
          padding = { right = 1 },
          -- define the section separator
          surround = { separator = "left", condition = false },
        },
        -- add a component for the current git branch if it exists and use no separator for the sections
        astronvim.status.component.git_branch { surround = { separator = "none" } },
        -- add a component for the current git diff if it exists and use no separator for the sections
        astronvim.status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
        -- fill the rest of the statusline
        -- the elements after this will appear in the middle of the statusline
        astronvim.status.component.fill(),
        -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
        astronvim.status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
        -- fill the rest of the statusline
        -- the elements after this will appear on the right of the statusline
        astronvim.status.component.fill(),
        -- add a component for the current diagnostics if it exists and use the right separator for the section
        astronvim.status.component.diagnostics { surround = { separator = "right" } },
        -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
        astronvim.status.component.lsp { lsp_progress = false, surround = { separator = "right" } },
        -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
        -- all of the children of this table will be treated together as a single component
        {
          -- define a simple component where the provider is just a folder icon
          astronvim.status.component.builder {
            -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
            { provider = astronvim.get_icon "FolderClosed" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the foreground color to be used for the icon
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            surround = { separator = "right", color = "folder_icon_bg" },
          },
          -- add a file information component and only show the current working directory name
          astronvim.status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = { fname = function(nr) return vim.fn.getcwd(nr) end, padding = { left = 1 } },
            -- disable all other elements of the file_info component
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = { separator = "none", color = "file_info_bg", condition = false },
          },
        },
        -- the final component of the NvChad statusline is the navigation section
        -- this is very similar to the previous current working directory section with the icon
        { -- make nav section with icon border
          -- define a custom component with just a file icon
          astronvim.status.component.builder {
            { provider = astronvim.get_icon "ScrollText" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the icon foreground
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
          },
          -- add a navigation component and just display the percentage of progress in the file
          astronvim.status.component.nav {
            -- add some padding for the percentage provider
            percentage = { padding = { left = 1, right = 1 } },
            -- disable all other providers
            ruler = false,
            scrollbar = false,
            -- define the foreground color
            hl = { fg = "nav_icon_bg" },
            -- use no separator and define the background color
            surround = { separator = "none", color = "file_info_bg" },
          },
        },
      }

      -- a second element in the heirline setup would override the winbar
      -- by only providing a single element we will only override the statusline
      -- and use the default winbar in AstroNvim

      -- return the final confiuration table
      return config
    end,
  },


  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
      end,
    }
  end,


  -- ["feline"] = function()
  --   local status_ok, null_ls = pcall(require, "feline")
  --   if not status_ok then
  --     return
  --   end
  --
  --   feline.setup = {
  --     theme = {
  --       fg = status.get_hl_prop("Feline", "foreground", '#fff'),
  --       bg = status.get_hl_prop("Feline", "background", '#f00'),
  --     }
  --   }
  -- end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    local set = vim.opt
    local global = vim.g
    -- Set options
    set.relativenumber = true
    -- catppuccin theme
    global.catppuccin_flavour = "macchiato"
    -- Material theme settings
    global.material_style = "oceanic"
    -- Nightly colorscheme settings
    global.nightflyItalics = 0
    global.nightflyCursorColor = 1
    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>", opts)
    -- vim.cmd [[colorscheme nightfly]]
    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]

    -- On saving javascript/typescript file format with prettier
    -- vim.cmd [[
    --   autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.graphql,*.html,*.css Prettier 
    -- ]]
    -- vim.cmd [[
    --   autocmd bufwritepre *.js,*.jsx,*.ts,*.tsx,*.graphql,*.html,*.css | Prettier
    -- ]]
    --
    -- vim.cmd [[
    --   autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()
    -- ]]
    -- vim folds
    -- vim.cmd [[
    --   filetype plugin indent on
    --   syntax on
    --   autocmd Filetype * AnyFoldActivate 
    --   set foldlevel=99  " opn all folds
    -- ]]
  end,
}


return config
