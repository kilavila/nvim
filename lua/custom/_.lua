local util = require("custom.util")

M = {}

-- TODO: keep sign id in DB?
local sign_id = 1

M.new = function()
	vim.fn.sign_define("Note", {
		text = "📌",
		texthl = "Note",
		numhl = "Note",
	})

	local current = util.get_current()
	local notes = {}

	vim.fn.sign_place(sign_id, "Note", "Note", current.buffer, { lnum = current.line })

	-- TODO: Open floating window for creating note
	-- insert note into table
	-- save table to DB?

	table.insert(notes, {
		id = sign_id,
		buffer = current.buffer,
		line = current.line,
	})

	sign_id = sign_id + 1

	print(notes[1].id, notes[1].buffer, notes[1].line)
end

return M
