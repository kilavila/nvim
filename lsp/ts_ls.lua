return {
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	root_markers = {

		{
			'angular.json',
			'package.json',
			'tsconfig.app.json',
			'tsconfig.json',
		},
		'.git',
		'.jj'
	},
	-- settings = { }
}
