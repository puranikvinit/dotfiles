local setup, copilot = pcall(require, "CopilotChat")
if not setup then
	return
end

copilot.setup()
