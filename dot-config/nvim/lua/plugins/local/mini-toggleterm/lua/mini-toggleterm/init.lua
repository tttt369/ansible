local M = {}

local function get_name()
  local fullpath = vim.api.nvim_buf_get_name(0)
  local filename = vim.fn.fnamemodify(fullpath, ":t")
  return filename
end

local function get_id()
  local bufname = vim.api.nvim_buf_get_name(0)  -- 対象バッファの番号を0で現在バッファ
  local id = bufname:match("term://.-//(%d+):")
  id = tonumber(id)
  return id
end

M.session = {}
function M.setup()
  vim.keymap.set('n', '<leader>t', function()
    local fname = get_name()

    vim.cmd('belowright split | terminal')

    local id = get_id()

    M.session[fname] = id

    for k,v in pairs(M.session) do
      print(k .. " => " .. tostring(v))
    end

  end)
end

return M

