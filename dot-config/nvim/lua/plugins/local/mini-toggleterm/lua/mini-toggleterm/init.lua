local M = {}
M.terminal_id = {}

local function debug_obj(obj)
  for k,v in pairs(obj) do
    print(k .. " => " .. tostring(v))
  end
end

local function get_name()
  local fullpath = vim.api.nvim_buf_get_name(0)
  return fullpath
end

local function get_buf_id()
  local buf_nr = vim.api.nvim_get_current_buf()
  return buf_nr
end

local function open_terminal()
  local file = vim.api.nvim_get_current_win()

  vim.cmd('belowright split | terminal')

  local terminal = vim.api.nvim_get_current_win()

  table.insert(M.terminal_id, terminal)
  debug_obj(M.terminal_id)
end

local function test()
  local tab = vim.api.nvim_get_current_tabpage()
  print(tab)

  local tabs = vim.api.nvim_list_tabpages()
  print(vim.inspect(tabs))
  for _, tab in ipairs(tabs) do
    local wins = vim.api.nvim_tabpage_list_wins(tab)
    print("tab:", tab, "windows:", vim.inspect(wins))
  end
end


local function toggle_terminal()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local all_tabs = vim.api.nvim_list_tabpages()

  local win_obj = {}
  for _, tab in ipairs(all_tabs) do
    if (tab == current_tab) then
      local wins = vim.api.nvim_tabpage_list_wins(tab)
      win_obj = vim.inspect(wins)
      print("tab:", tab, "windows:", win_obj)
    end
  end

  local term_id
  for _, id in ipairs(M.terminal_id) do
    if (win_obj[id]) then
      term_id = id
    end
  end


  if (term_id) then
    vim.cmd('buffer ' .. term_id)
    vim.cmd('hide')
  else
    open_terminal()
  end

end

function M.setup()
  vim.keymap.set('n', '<leader>t', toggle_terminal)
end

return M
