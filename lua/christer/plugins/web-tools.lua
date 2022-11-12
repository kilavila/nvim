local web_tools_status, web_tools = pcall(require, "web-tools")
if not web_tools_status then
	return
end

web_tools.setup({
	keymaps = {
		rename = nil,
		repeat_rename = ".",
	},
})
