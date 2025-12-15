local M = {}
M.file2term = {}
M.height = 20

local function debug_obj(obj) 
  for k,v in pairs(obj) do 
    print(k .. ": " .. tostring(v)) 
  end 
end

local function open_terminal()
  local file_buf = vim.api.nvim_get_current_buf()

  vim.cmd('botright ' .. M.height .. 'split | terminal')

  local term_buf = vim.api.nvim_get_current_buf()

  print("M.file2term")
  M.file2term[file_buf] = term_buf
  print(debug_obj(M.file2term))
end

local function test()
end

local function toggle_terminal()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local win_list = vim.api.nvim_tabpage_list_wins(current_tab) -- Get all windows from current tab.

  -- Convert the currently displayed buff_id to a boolean element.
  local win_obj_buf = {}
  for _, win in pairs(win_list) do
    local buf = vim.api.nvim_win_get_buf(win)
    win_obj_buf[buf] = true
  end

  print("win_obj_buf")
  print(debug_obj(win_obj_buf))

  -- Check all terminal window in current tabs.
  local term_buf
  for _, buf in pairs(M.file2term) do
    if (#M.file2term == 0) then 
      print("break no term")
      break 
    end
    print("loop_buf1", buf)
    if (win_obj_buf[buf]) then
      print("term_buf", buf)
      term_buf = buf
      break
    end
  end

  -- Find the window thats initiate the terminal window.
  local past_term_buf
  for buf, _ in pairs(win_obj_buf) do
    if (#M.file2term == 0) then 
      print("break no term")
      break

    elseif (term_buf) then 
      print("break there is term")
      break
    end

    print("loop_buf2", buf)
    if (M.file2term[buf]) then
      print("past_term_buf", M.file2term[buf])
      past_term_buf = M.file2term[buf]
      break
    end
  end

  -- If there is terminal window.
  if (term_buf) then
    print("if")
    for k,v in pairs(vim.fn.win_findbuf(term_buf)) do 
      M.height = vim.api.nvim_win_get_height(v)
      vim.api.nvim_win_hide(v)
    end 
  -- If there is window thats initiate the terminal.
  elseif (past_term_buf) then
    print("elseif")
    vim.cmd('botright ' .. M.height .. 'split | buffer ' .. past_term_buf)
  else
    print("else")
    open_terminal()
  end

end

function M.setup()
  vim.keymap.set('n', '<leader>t', toggle_terminal)
end

return M
