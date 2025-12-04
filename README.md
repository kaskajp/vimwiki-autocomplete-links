# vimwiki-autocomplete-links

Autocomplete `[[links]]` to other notes in your VimWiki.

## Features

- Autocomplete wiki page names when typing `[[`
- Press `<C-Space>` to trigger completion popup
- Navigate with arrow keys and press `<Enter>` to insert the link
- Automatically appends `]]` to complete the link
- Uses your existing `g:vimwiki_list` configuration

## Installation

### Vim 8 Native Packages (recommended)

```bash
git clone https://github.com/kaskajp/vimwiki-autocomplete-links \
    ~/.vim/pack/plugins/start/vimwiki-autocomplete-links
```

### vim-plug

```vim
Plug 'kaskajp/vimwiki-autocomplete-links'
```

### Vundle

```vim
Plugin 'kaskajp/vimwiki-autocomplete-links'
```

### packer.nvim (Neovim)

```lua
use 'kaskajp/vimwiki-autocomplete-links'
```

## Requirements

- [vimwiki](https://github.com/vimwiki/vimwiki) must be installed
- Vim 8+ or Neovim

## Usage

1. Open a vimwiki file
2. Type `[[` to start a link
3. Type a few characters of the page name
4. Press `<C-Space>` to trigger completion
5. Use `<Up>`/`<Down>` arrows to navigate
6. Press `<Enter>` to accept and close with `]]`

## Configuration

### Disable arrow key navigation in popup

By default, arrow keys navigate the popup menu. To disable:

```vim
let g:vimwiki_link_complete_popup_arrows = 0
```

### Vimwiki settings

The plugin reads from your existing `g:vimwiki_list` configuration:

```vim
let g:vimwiki_list = [{'path': '~/my-wiki/', 'ext': '.md'}]
```

If not set, defaults to `~/vimwiki/` with `.wiki` extension.

## Mappings

| Mode   | Mapping     | Description                              |
|--------|-------------|------------------------------------------|
| Insert | `<C-Space>` | Trigger link completion                  |
| Insert | `<CR>`      | Accept selection + append `]]`           |
| Insert | `<Up>`      | Previous item in popup (when visible)    |
| Insert | `<Down>`    | Next item in popup (when visible)        |

## Documentation

For more details, see the help file:

```vim
:help vimwiki-autocomplete-links
```

## License

MIT
