-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Define a global function to toggle CodeCompanion chat on the side
function ToggleCodeCompanion()
  local target_ft = "codecompanion" -- Using filetype to identify the buffer
  local bufnr_found = nil
  local bufnr_found_valid = false

  -- Search for an existing buffer of type 'codecompanion'
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].filetype == target_ft then
      bufnr_found = bufnr
      if vim.api.nvim_buf_is_valid(bufnr_found) then
        bufnr_found_valid = true
        break
      end
    end
  end

  -- If a valid buffer is found, check if it's displayed in any window
  if bufnr_found_valid then
    vim.api.nvim_buf_delete(bufnr_found, { force = true })
  else
    -- No valid buffer found, create a new one
    vim.cmd("vnew | wincmd l")
    vim.bo.filetype = target_ft
    vim.cmd("CodeCompanionChat")

    -- work around to delete the empty buffer that is created by the plugin
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[bufnr].filetype == target_ft then
        bufnr_found = bufnr
        if vim.api.nvim_buf_is_valid(bufnr_found) then
          bufnr_found_valid = true
          break
        end
      end
    end

    vim.api.nvim_buf_delete(bufnr_found, { force = true })
  end
end
