-- Every Env File should implements methods below

-- getFormatOnSavePattern
-- getTSEnsureList
-- getLSPEnsureList
-- getLSPConfigMap
-- getToolEnsureList
-- getNulllsSources
-- getNeotestAdapters

local enabledEnv = {}
local init = function(userConfig)
	if userConfig.lua.enable then
		table.insert(enabledEnv, require("insis.env.lua")(userConfig.lua))
	end
	if userConfig.golang.enable then
		table.insert(enabledEnv, require("insis.env.golang")(userConfig.golang))
	end
end

-- loop through enabledEnv list and call envFunc on each Env file
local function collectList(envFunc)
	local list = {}
	for _, env in ipairs(enabledEnv) do
		for _, p in ipairs(env[envFunc]()) do
			if table.indexOf(list, p) == -1 then
				table.insert(list, p)
			end
		end
	end
	return list
end

return {
	init = init,
	getFormatOnSavePattern = function()
		return collectList("getFormatOnSavePattern")
	end,
	getTSEnsureList = function()
		return collectList("getTSEnsureList")
	end,
	getLSPEnsureList = function()
		return collectList("getLSPEnsureList")
	end,
	getToolEnsureList = function()
		return collectList("getToolEnsureList")
	end,
	getLSPConfigMap = function()
		local configMap = {}
		for _, env in ipairs(enabledEnv) do
			for k, v in pairs(env.getLSPConfigMap()) do
				configMap[k] = v
			end
		end
		return configMap
	end,
	getNulllsSources = function()
		return collectList("getNulllsSources")
	end,
	getNeotestAdapters = function()
		return collectList("getNeotestAdapters")
	end,
}
