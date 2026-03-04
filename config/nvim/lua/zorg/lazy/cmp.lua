return {
  {
    'hrsh7th/nvim-cmp',
    enabled = false,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      "hrsh7th/cmp-emoji",
      -- 'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      "David-Kunz/cmp-npm",
      'onsails/lspkind.nvim'
    },
    config = function()
      local cmp = require('cmp')
      local types = require("cmp.types")
      local luasnip = require("luasnip")
      local lspkind = require('lspkind')

      local function deprioritize_snippet(entry1, entry2)
        if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
        if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
      end

      require('cmp').setup({


        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          -- { name = 'nvim_lsp_signature_help' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = "emoji" },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },

        sorting = {
          priority_weight = 2,
          comparators = {
            deprioritize_snippet,
            -- the rest of the comparators are pretty much the defaults
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.scopes,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },

        mapping = {
          ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),

          ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),

          ['<C-space>'] = cmp.mapping.complete({}),

          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
                })
              end
            else
              fallback()
            end
          end),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },

        formatting = {
          fields = { 'abbr', 'icon', 'kind', 'menu' },
          expandable_indicator = true,

          format = lspkind.cmp_format({
            mode = 'symbol',
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            menu = ({
              buffer = "[Buff]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              nvim_lua = "[Lua]",
            }),
            before = function(entry, vim_item)
              return vim_item
            end
          })
        },

        window = {
          completion = cmp.config.window.bordered({
            border = 'rounded',
          }),
          documentation = cmp.config.window.bordered({
            border = 'rounded',
          }),
        },

        completion = {
          keyword_length = 1,
          completeopt = 'menu,menuone,noinsert',
        },
        preselect = cmp.PreselectMode.Item,
        view = {
          entries = 'custom',
        },

      })
    end
  }
}
