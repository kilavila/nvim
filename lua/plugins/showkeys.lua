return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	opts = {
		timeout = 3,
		maxkeys = 7,
		position = "top-right",
		show_count = true,
		winopts = {
			border = "rounded",
		},
		excluded_modes = { "i" },
	},
}
