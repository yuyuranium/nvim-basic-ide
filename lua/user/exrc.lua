local exrc_status_ok, exrc = pcall(require, "exrc")
if not exrc_status_ok then
	return
end

exrc.setup({
  files = {
    ".nvimrc.lua"
  }
})
