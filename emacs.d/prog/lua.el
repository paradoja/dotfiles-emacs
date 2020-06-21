(require 'use-package)

(requirements-add
 lua.el
 (lua-lsp
  (executable-find "lua-lsp")
  "Lua lsp"
  "https://github.com/Alloyed/lua-lsp"
  "luarocks install --local --server=http://luarocks.org/dev lua-lsp")
 (luacheck
  (executable-find "luacheck")
  "Lua linter"
  "https://github.com/mpeterv/luacheck"
  "luarocks install --local luacheck")
 (lcf
  (executable-find "lua.reformat")
  "Lua formatter"
  "https://luarocks.org/modules/martin-eden/lcf"
  "luarocks install --local lcf"))

(use-package lua-mode)
(use-package company-lua
  :config
  (add-to-list 'company-backends 'company-lua))
(use-package flymake-lua)

(use-package love-minor-mode)
