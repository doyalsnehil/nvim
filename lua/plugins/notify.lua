return {
  'rcarriga/nvim-notify',
  config = function()
    -- You can set it as the default notification system
    vim.notify = require('notify')
  end
}

