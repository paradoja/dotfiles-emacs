(require 'use-package)

(requirements-add
 lua.el
 (lua-lsp
  (executable-find "lua-lsp")
  "Lua lsp
   luarocks install --local --server=http://luarocks.org/dev lua-lsp"
  "https://github.com/Alloyed/lua-lsp")
 (luacheck
  (executable-find "luacheck")
  "Lua linter
   luarocks install --local luacheck"
  "https://github.com/mpeterv/luacheck")
 (lcf
  (executable-find "lua.reformat")
  "Lua formatter
   luarocks install --local lcf"
  "https://luarocks.org/modules/martin-eden/lcf"))

(use-package lua-mode)
(use-package company-lua
  :config
  (add-to-list 'company-backends 'company-lua))
(use-package flymake-lua)

(use-package love-minor-mode)
