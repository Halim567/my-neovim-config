local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	["\22"] = "VISUAL BLOCK", -- \22 represents <C-v>
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	["\19"] = "SELECT BLOCK", -- \19 represents <C-s>
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode] or "UNKNOWN"):upper()
end

local function update_mode_colors()
	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = "%#StatusLineAccent#"
	if current_mode == "n" then
		mode_color = "%#StatuslineAccent#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#StatuslineInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "\22" then
		mode_color = "%#StatuslineVisualAccent#"
	elseif current_mode == "R" then
		mode_color = "%#StatuslineReplaceAccent#"
	elseif current_mode == "c" then
		mode_color = "%#StatuslineCmdLineAccent#"
	elseif current_mode == "t" then
		mode_color = "%#StatuslineTerminalAccent#"
	end
	return mode_color
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = " %#LspDiagnosticsSignError#E: " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = " %#LspDiagnosticsSignWarning#W: " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = " %#LspDiagnosticsSignHint#H: " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = " %#LspDiagnosticsSignInformation#I: " .. count["info"]
	end

	return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function filetype()
	return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
	if vim.bo.filetype == "alpha" then
		return ""
	end
	return " %P %l:%c "
end

-- Define filepath and filename functions
local function filepath()
	return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h") .. "/"
end

local function filename()
	return vim.fn.expand("%:t")
end

local function encoding()
	return string.format(" %s ", vim.bo.fileencoding):upper()
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		"%#Statusline#",
		update_mode_colors(),
		mode(),
		"%#Normal# ",
		filepath(),
		filename(),
		"%#Normal#",
		lsp(),
		"%=%#StatusLineExtra#",
		filetype(),
		encoding(),
		lineinfo(),
	})
end

function Statusline.inactive()
	return " %F"
end

function Statusline.short()
	return "%#StatusLineNC#   NvimTree"
end

return Statusline
