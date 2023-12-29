if not require("config").pde.ai then
	return {}
end

return {
	{
		"Exafunction/codeium.vim",
		event = "InsertEnter",
		enabled = true,
        -- stylua: ignore
        config = function()
            vim.g.codeium_disable_bindings = 1
            vim.keymap.set("i", "<A-l>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
            vim.keymap.set("i", "<A-p>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
            vim.keymap.set("i", "<A-n>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
            vim.keymap.set("i", "<A-c>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
            vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
        end,
	},
}
