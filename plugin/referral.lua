-- Set up binding for :Referral <x>
vim.api.nvim_create_user_command('Referral', function(opts)
  require('referral').referral(opts)
end, {
  desc = 'look for references in ruby source code using the referral tool',
  nargs = '+',
  force = true
})
