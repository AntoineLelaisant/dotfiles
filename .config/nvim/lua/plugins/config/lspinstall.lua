require'lspinstall'.setup()

local installed_servers = require'lspinstall'.installed_servers()
for _, server in pairs(installed_servers) do
  require'lspconfig'[server].setup{}
end

local required_servers = {
  "bash",
  "css",
  "dockerfile",
  "go",
  "graphql",
  "html",
  "java",
  "json",
  "lua",
  "php",
  "python",
  "ruby",
  "rust",
  "svelte",
  "typescript",
  "vue",
  "yaml"
}

for _, server in pairs(required_servers) do
  if not vim.tbl_contains(installed_servers, server) then
    require'lspinstall'.install_server(server)
  end
end

require 'lspconfig'.phpactor.setup{}
