local api = vim.api
local diagnostic = vim.diagnostic
local map = vim.keymap
local lsp = vim.lsp
local opt = vim.opt

lsp.enable("lua_ls")

api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = assert(lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/completion') then
			opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
			lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			map.set("i", "<C-n>", function()
				lsp.completion.get()
			end)
		end
	end,
})

diagnostic.config({
	virtual_lines = true

	-- virtual_lines = {
	-- 	current_line = true,
	-- }
})
