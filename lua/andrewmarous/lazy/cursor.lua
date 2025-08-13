local uv = vim.uv or vim.loop

local plugin_dir = vim.fn.stdpath("data") .. "/lazy/cursortab.nvim"
local bin_dir    = vim.fn.stdpath("data") .. "/cursortab/bin"
local bin_path   = bin_dir .. "/cursortab-server"  -- fixed typo
local server_port = 14850

local function executable_exists(path)
  return vim.fn.executable(path) == 1
end

local function ensure_built()
  if executable_exists(bin_path) then return true end
  if vim.fn.isdirectory(plugin_dir) == 0 then
    vim.notify("[cursortab] plugin not found at " .. plugin_dir, vim.log.levels.WARN)
    return false
  end
  vim.fn.mkdir(bin_dir, "p")
  local id = vim.fn.jobstart({ "go", "build", "-o", bin_path, "." }, { cwd = plugin_dir })
  local rc = vim.fn.jobwait({ id }, 10 * 60 * 1000)[1]
  if rc ~= 0 then
    vim.notify("[cursortab] go build failed (exit " .. tostring(rc) .. ")", vim.log.levels.ERROR)
    return false
  end
  return executable_exists(bin_path)
end

-- Port check using netcat:
local function is_port_in_use(port)
  local cmd = string.format("nc -z 127.0.0.1 %d", port)
  -- On most systems `os.execute` returns 0 when the command exits successfully.
  local ok = os.execute(cmd)
  return ok == 0
end

local handle ---@type uv_process_t|nil

local function start_server()
  -- If *any* process already listens on this port, don't spawn another.
  if is_port_in_use(server_port) then
    return
  end
  if not ensure_built() then return end

  handle = uv.spawn(bin_path, { stdio = { nil, nil, nil }, detached = true }, function(code, signal)
    -- just close our handle; don't touch any other instances
    if handle and not handle:is_closing() then handle:close() end
  end)

  if not handle then
    vim.notify("[cursortab] failed to spawn server", vim.log.levels.ERROR)
    return
  end

  -- Don't keep Nvim alive waiting for the child
  uv.unref(handle)
end

local function stop_server()
  -- Only try to stop the process we spawned (leave others alone)
  if handle and handle.pid then
    pcall(handle.kill, handle, "sigterm")
  end
end

vim.api.nvim_create_autocmd("VimEnter", { once = true, callback = start_server })
vim.api.nvim_create_autocmd({ "ExitPre", "VimLeavePre" }, { callback = stop_server })

-- return {
--     "reachingforthejack/cursortab.nvim",
--     build = ensure_built,
--     lazy = false,
--     priority = 1000,
-- }
