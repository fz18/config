local cmp = pRequire("cmp")
local luasnip = pRequire("luasnip")
local cfg = require("insis.config").cmp

if not cmp or not luasnip or not cfg or not cfg.enable then
	return
end
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local mapping = {
	[cfg.keys.select_next_item] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),
	[cfg.keys.select_prev_item] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
	[cfg.keys.confirm] = cmp.mapping({
		i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		c = function(fallback)
			if cmp.visible() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
			else
				fallback()
			end
		end,
	}),
	-- [cfg.keys.complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	[cfg.keys.abort] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	-- Accept currently selected item. If none selected, `select` first item.
	-- Set `select` to `false` to only confirm explicitly selected items.
	[cfg.keys.scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
	[cfg.keys.scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
}

-- select next/prev in command mode
keymap("c", cfg.keys.select_next_item, "<C-n>", {
	remap = true,
	silent = true,
})
keymap("c", cfg.keys.select_prev_item, "<C-p>", {
	remap = true,
	silent = true,
})

cmp.setup({
	-- we use luasnip
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = mapping,
	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			group_index = 1,
		},
		{
			name = "nvim_lsp_signature_help",
			group_index = 1,
		},
		{
			name = "luasnip",
			group_index = 2,
		},
		{
			name = "buffer",
			group_index = 3,
		},
		{
			name = "path",
			group_index = 3,
		},
	}),
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { {
		name = "buffer",
	} },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ {
		name = "path",
	} }, { {
		name = "cmdline",
	} }),
})

cmp.setup.filetype({ "markdown", "help" }, {
	window = {
		documentation = cmp.config.disable,
	},
	sources = { {
		name = "luasnip",
	}, {
		name = "buffer",
	}, {
		name = "path",
	} },
})
