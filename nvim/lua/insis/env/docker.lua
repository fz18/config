return function()
	return {
		getFormatOnSavePattern = function()
			return {}
		end,
		getTSEnsureList = function()
			return {}
		end,
		getLSPEnsureList = function()
			return { "dockerls" }
		end,
		getLSPConfigMap = function()
			return {
				dockerls = require("insis.lsp.config.docker"),
			}
		end,
		getToolEnsureList = function()
			return {}
		end,
		getNulllsSources = function()
			return {}
		end,
	}
end
