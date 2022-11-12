local setup, FTerm = pcall(require, "FTerm")
if not setup then
	return
end

FTerm.setup()
