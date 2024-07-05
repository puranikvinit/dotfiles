local setup, markdown = pcall(require, "render-markdown")
if not setup then
	return
end

markdown.setup({})
