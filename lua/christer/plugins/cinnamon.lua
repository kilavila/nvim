local setup, cinnamon = pcall(require, "cinnamon")
if not setup then
	return
end

cinnamon.setup({
	centered = true,
	default_delay = 7,
})
