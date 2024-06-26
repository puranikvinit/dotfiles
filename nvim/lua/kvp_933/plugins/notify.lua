local setup, notify = pcall(require, "notify")
if not setup then
	return
end

notify.setup({
	notify._config(),
	fps = 60,
	max_width = 60,
	render = "compact",
	stages = "fade",
})
