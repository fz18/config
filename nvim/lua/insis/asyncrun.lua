-- 定义自定义执行器
vim.g.asyncrun_open = 10

vim.g.asyncrun_quickfix = 1

local executors = {
	-- Python
	py = {
		command = "python3",
		args = { "%" },
		output = "term",
	},
	-- C
	c = {
		command = "gcc",
		args = { "-o", "%:t:r", "%" },
		output = "qf",
		error_pattern = [[\v(%[.+\]|%<\d+\>):(%d+):(.+)]],
		postprocess = function()
			vim.cmd([[copen]])
			vim.cmd([[wincmd p]])
		end,
	},
	-- C++
	cpp = {
		command = "g++",
		args = { "-std=c++11", "-o", "%:t:r", "%" },
		output = "qf",
		error_pattern = [[\v(%[.+\]|%<\d+\>):(%d+):(.+)]],
		postprocess = function()
			vim.cmd([[copen]])
			vim.cmd([[wincmd p]])
		end,
	},
	-- Go
	go = {
		command = "go ",
		args = { "run", "%:t" },
		output = "term",
	},
}

-- 定义执行命令
local function run_command()
	local filetype = vim.bo.filetype
	local executor = executors[filetype]

	if executor then
		local cmd = executor.command .. " " .. table.concat(executor.args, " ")
		local output_target = executor.output or "term"

		-- 执行命令并输出结果
		vim.api.nvim_exec(string.format("AsyncRun -mode=term -pos=tmux %s", cmd), false)

		-- 处理错误信息
		if executor.error_pattern then
			vim.api.nvim_exec(string.format('AsyncRunAddErrorPattern("%s")', executor.error_pattern), false)
		end

		-- 执行后处理函数
		if executor.postprocess then
			executor.postprocess()
		end
	else
		-- 如果没有定义执行器，则默认使用 :w 执行保存操作
		vim.api.nvim_command("w")
	end
end

-- 设置快捷键
vim.keymap.set("n", "<Leader>r", function()
	run_command()
end)
