-- Set up functions for interperters needed by mason to setup LSP servers

local suggested_node_version = "22"
local suggested_python_version = "3.13"

local function setup_node(suggested_version)
  local nvm_dir = os.getenv("HOME") .. "/.nvm"

  local version = ""

  -- Read the content of the alias file if it exists and is opened successfully
  local handle = io.popen("source " .. nvm_dir .. "/nvm.sh && nvm version neovim")
  if handle then
    version = handle:read("*a"):gsub("%s+", "")
    handle:close()
  end

  if version == "" then
    vim.notify("The 'neovim' alias in nvm is not set or is empty. Please run 'nvm alias neovim " .. suggested_version .. "'.", vim.log.levels.WARN)
    return
  end

  local path = nvm_dir .. "/versions/node/" .. version .. "/bin"
  vim.env.PATH = path .. ":" .. vim.env.PATH
end


local function setup_python(suggested_version)
  local uv_venv_dir = os.getenv("HOME") .. "/.uv-neovim-venv"

  if not vim.uv.fs_stat(uv_venv_dir) then
    local command = "uv venv ~/.uv-neovim-venv --python=" .. suggested_version .. " --python-preference only-managed"
    vim.notify("The neovim venv does not exist. Please run '" .. command .. "'.", vim.log.levels.WARN)
    return
  end

  local path = uv_venv_dir .. "/bin"
  vim.env.PATH = path .. ":" .. vim.env.PATH
end

setup_node(suggested_node_version)
setup_python(suggested_python_version)
