return {
  "nvim-mini/mini.hipatterns",
  recommended = true,
  event = "LazyFile",
  opts = function()
    local hi = require("mini.hipatterns")
    return {}
  end,
}
