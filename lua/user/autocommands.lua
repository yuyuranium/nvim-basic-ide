vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd("hi link illuminatedWord LspReferenceText")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
	local line_count = vim.api.nvim_buf_line_count(0)
		if line_count >= 5000 then
			vim.cmd("IlluminatePauseBuf")
		end
	end,
})

-- Auto colorcolumn for some filetypes
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt.colorcolumn = { 80 }
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  pattern = { "verilog", "systemverilog" },
  callback = function()
    vim.opt.colorcolumn = { 100 }
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt.colorcolumn = { 72 }
  end,
})

-- lua and java use 2 space for indention
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  pattern = { "lua", "java" },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})
