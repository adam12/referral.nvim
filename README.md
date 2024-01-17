# Neovim plugin for the Referral Ruby gem

Add the convenient `:Referral` command to your Neovim configuration, which will
call the `referral` binary provided by [`referral`][1], and then load the results
into the quickfix window.

## Installation

With Lazy.nvim, add the following to your configuration

```lua
{
  'adam12/referral.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = true,
  cmd = 'Referral',
}
```

## Usage

Inside a Ruby project, use the `:Referral` command to interact with `referral`.
The result will be loaded into the quickfix window, which you can open with `:copen`.

### Example

`:Referral -n IPAddress` to look up a partial-name match of `IPAddress`.

[1]: https://rubygems.org/gems/referral
