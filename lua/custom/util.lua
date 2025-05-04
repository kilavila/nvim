M = {}

---@type fun(): string
local _get_cword = function()
	---@type string
	local cword = vim.fn.expand("<cword>")

	return cword
end

---@type fun(): string
local _get_file_type = function()
	---@type string
	local file_name = vim.api.nvim_buf_get_name(0)
	---@type string[]
	local file_name_table = {}

	for part in string.gmatch(file_name, "([^%.]+)") do
		table.insert(file_name_table, part)
	end

	---@type string
	local file_type = file_name_table[table.maxn(file_name_table)]
	return file_type
end

---@type fun(): number
local _get_line = function()
	---@type number[]
	local cursor_position = vim.api.nvim_win_get_cursor(0)
	---@type number
	local current_line = cursor_position[1]

	return current_line
end

---@type fun(): number
local _get_buffer = function()
	---@type number
	local buffer = vim.api.nvim_get_current_buf()

	return buffer
end

---@type fun(): Current
local _get_current = function()
	---@type Current
	local current = {
		buffer = _get_buffer(),
		cursor_word = _get_cword(),
		file_type = _get_file_type(),
		line = _get_line(),
	}

	return current
end

M.get_cword = _get_cword
M.get_file_type = _get_file_type
M.get_line = _get_line
M.get_buffer = _get_buffer

--- Get values relevant to current position.
---
--- current = {
---	buffer number
---	cursor_word string
---	file_type string
---	line number
--- }
M.get_current = _get_current

return M
