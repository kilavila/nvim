local pantran_status, pantran = pcall(require, "pantran")
if not pantran_status then
	return
end

pantran.setup({
	default_engine = "yandex",
})
