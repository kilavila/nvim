---| [buffer:]      Current buffer ID
---| [cursor_word:] Current string below cursor
---| [file_type:]   Current buffer file extension
---| [line:]        Buffer-relative cursor position
---
---@class (exact) current
---@field buffer number
---@field cursor_word string
---@field file_type string
---@field line number

---@type fun(): string
local _get_cword = function() return vim.fn.expand "<cword>" end

---@type fun(): string
local _get_file_type = function()
  local file_name = vim.api.nvim_buf_get_name(0)
  ---@type table<string>
  local file_name_table = {}

  for part in string.gmatch(file_name, "([^%.]+)") do
    table.insert(file_name_table, part)
  end

  local file_type = file_name_table[table.maxn(file_name_table)]
  return file_type
end

---@type fun(): number
local _get_current_line = function()
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor_position[1]

  return current_line
end

---@type fun(): current
local _get_current = function()
  --- Table of current relevant values
  ---@type current
  local current = {
    buffer = vim.api.nvim_get_current_buf(),
    cursor_word = _get_cword(),
    file_type = _get_file_type(),
    line = _get_current_line(),
  }

  return current
end

-- TODO: keep sign id in DB?
local sign_id = 1

return {

  log = function()
    --- Table of current relevant values
    ---@type current
    local current = _get_current()

    --- The string that will be inserted on the line below current line
    --- Uses different print/log method based on current file extension
    ---@type string
    local print_string

    if current.file_type == "lua" then
      print_string = "print('" .. current.cursor_word .. ": ', " .. current.cursor_word .. ")"
    elseif current.file_type == "js" or current.file_type == "ts" then
      print_string = "console.log('" .. current.cursor_word .. ": ', " .. current.cursor_word .. ")"
    elseif current.file_type == "sh" then
      print_string = "printf('" .. current.cursor_word .. ": ', " .. current.cursor_word .. ")"
    end

    vim.api.nvim_buf_set_lines(current.buffer, current.line, current.line, false, { print_string })
  end,

  note = function()
    vim.fn.sign_define("Note", {
      text = "📌",
      texthl = "Note",
      numhl = "Note",
    })

    local current = _get_current()
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
  end,
}
