local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

return h.make_builtin({
  name = "bsc",
  meta = {
    url = "https://github.com/B-Lang-org/bsc",
    description = "Bluespec Compiler",
  },
  method = DIAGNOSTICS,
  filetypes = { "bsv" },
  generator_opts = {
    command = "bsc",
    args = { "-sim", "-bdir", "/tmp", "-p", ".:%/Libraries:$DIRNAME", "-u", "$FILENAME" },
    to_stdin = false,
    from_stderr = true,
    to_temp_file = true,
    format = "raw",
    on_output = function(params, done)
      local output = params.output
      if not output then
        return done()
      end

      local diagnostics = {}
      local severity = {
        Error = 1,
        Warning = 2
      }

      local next = next
      local lines = vim.split(output, "\n")

      local diagnostic = {}

      for _, line in ipairs(lines) do
        if line ~= "" then
          local err, filename, row, col, code =
            line:match("(.*): \"(.*)\", line (%d*), column (%d*): %((.*)%)")

          if row ~= nil and col ~= nil then
            -- parse succeed, line is header
            if next(diagnostic) ~= nil then
              -- if previous diagnostic exists, insert into diagnostics
              table.insert(diagnostics, diagnostic)
            end

            diagnostic = {
              filename = filename,
              row = row,
              col = col,
              code = code,
              source = "bsv",
              message = "",
              severity = severity[err],
            }
          else
            -- parse failed, line is message
            if next(diagnostic) ~= nil then
              -- make sure diagnostics table is not empty
              diagnostic.message = diagnostic.message .. string.sub(line, 3) .. "\n"
            end
          end

        end
      end

      if next(diagnostic) ~= nil then
        -- if previous diagnostic exists, insert into diagnostics
        table.insert(diagnostics, diagnostic)
      end

      done(diagnostics)
    end,
  },
  factory = h.generator_factory,
})
