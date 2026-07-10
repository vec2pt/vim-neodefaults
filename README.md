# neodefaults.vim

Default settings from Neovim ([vim_diff.txt](https://neovim.io/doc/user/vim_diff/))


## Limitations

- Even with this plugin, Vim's behavior will still not be identical to Neovim's. This is due to deeper changes in Neovim's architecture and code.
- This plugin has been tested exclusively on Linux.
- In the path options (such as `backupdir`, `directory`, `undodir`, `viewdir`, `viminfofile`), the root folder is `vim`, not `nvim`.
- The mappings added to this plugin do not cover all the cases that Neovim covers, so they may be slightly buggy.
- `gc` / `gcc` mapping. For users of Vim 9.1 and later, ['comment.vim'](https://github.com/vim/vim/blob/master/runtime/pack/dist/opt/comment) will be loaded and used; for users of earlier versions and [Vim Classic](https://vim-classic.org/), I recommend considering the ['commentary.vim'](https://github.com/tpope/vim-commentary) plugin.
- Pairs mapping (e.g., `]a` / `[a`) is not included in this plugin. I recommend considering the ['unimpaired.vim'](https://github.com/tpope/vim-unimpaired).
- Remember, Vim doesn't have features like LSP and Treesitter, so the related settings aren't available.


## Installation

```bash
mkdir -p ~/.config/vim/plugin
curl -o ~/.config/vim/plugin/neodefaults.vim https://raw.githubusercontent.com/vec2pt/vim-neodefaults/refs/heads/main/plugin/neodefaults.vim
```

Add this line at the top of your `.vimrc` file.

```vim
unlet! g:loaded_neodefaults
source plugin/neodefaults.vim
```

You can also use the plugin manager, but this will (may) cause 'neodefaults.vim' to override your options.


## Testing

```bash
cd vim-neodefaults

# Export settings
vim -u NONE -c 'source plugin/neodefaults.vim' +'redir! > /tmp/vim.txt | silent set! all | redir END | qa'
nvim -u NONE +'redir! > /tmp/nvim.txt | silent set! all | redir END | qa'

# Diff in Vim
vimdiff /tmp/vim.txt /tmp/nvim.txt
# or in Neovim, if you prefer it
nvim -d /tmp/vim.txt /tmp/nvim.txt

# Cleanup temp files
rm -f /tmp/vim.txt /tmp/nvim.txt
```

Note that Neovim uses `shada` instead of `viminfo`.


## Acknowledgments

- [vim-sensible](https://github.com/tpope/vim-sensible)
- [nvim-defaults.vim](https://github.com/mikeslattery/nvim-defaults.vim)
- [defaults.vim](https://github.com/vim/vim/blob/master/runtime/defaults.vim)
