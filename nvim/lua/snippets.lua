local my_snippets = {
  ["log"] = "console.log(\"${1:message}\");",
  ["html"] = "<!DOCTYPE html>\n<html lang=\"en\">\n\t<head>\n\t\t<meta charset=\"UTF-8\">\n\t\t<title>${1:Document}</title>\n\t</head>\n\t<body>\n\t</body>\n</html>",
}

local function trigger_snippet_or_tab()
  local col = vim.fn.col('.') - 1
  if col == 0 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', false)
    return
  end

  local line = vim.api.nvim_get_current_line()
  local before_cursor = line:sub(1, col)
  local prefix = before_cursor:match('%w+$')

  if prefix and my_snippets[prefix] then
    local snippet_body = my_snippets[prefix]
    local prefix_len = #prefix
    vim.schedule(function()
      vim.api.nvim_buf_set_text(0, vim.fn.line('.')-1, col - prefix_len, vim.fn.line('.')-1, col, {})
      vim.schedule(function()
        vim.snippet.expand(snippet_body)
      end)
    end)
    return
  end

  if vim.snippet.active({ direction = 1 }) then
    vim.snippet.jump(1)
    return
  end

  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', false)
end

vim.keymap.set('i', '<Tab>', trigger_snippet_or_tab, { desc = "Smart Tab for Snippets" })
