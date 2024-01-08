local M = {}
local Job = require('plenary.job')

M.setup = function(config)
  config = config or {}

  -- Set up binding for :Referral <x>
  vim.api.nvim_create_user_command('Referral', function(opts)
    vim.notify('Running ' .. string.format([['referral %s']], opts.args))
    vim.fn.setqflist({}, 'r')

    Job:new({
      command = 'referral',
      args = vim.split(opts.args, ' '),
      on_exit = function(j, return_val)
        local data = j:result()

        if return_val == 0 then
          vim.schedule(function()
            vim.fn.setqflist({}, 'r', {title=string.format('Referral %s', opts.args), lines=data})
          end)
        end

        vim.schedule(function()
          vim.notify('Referral done!')
        end)
      end,
      on_stderr = function(_, msg)
        vim.notify(msg)
      end,
    }):start()
  end,
  {
    desc = 'Look for references in Ruby source code using the Referral tool',
    nargs = '+',
    force = true
  })
end

return M
