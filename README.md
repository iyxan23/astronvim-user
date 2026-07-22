# iyxan's nvim config

![screenshot](https://github.com/user-attachments/assets/ba041ec8-a07b-44b4-8a79-322c32bccc3a)

![another screenshot](https://github.com/user-attachments/assets/c14c42c6-1c72-48f7-a0a1-1f0a502ba0a9)

This is the config I use as my main code editor. It's built on top of
[AstroNvim](https://github.com/AstroNvim/AstroNvim), with the
[Lazy package manager](https://github.com/folke/lazy.nvim). I added and
modified a few things to it to make it fit for my own personal use. Feel
free to steal anything :)

- Global mappings

  Local leader set to `;` (previously `,`).

  - Normal Mode
    - `<S-J>` to `O<esc>o`
    - `<S-H>` to `^`
    - `<S-L>` to `$`
    - `<LDR>fW` to search only on open buffers, not the whole project
    - `<LDR>j` to `:HopLineStart` with hop.nvim
    - `<LDR>J` to `:HopLine` with hop.nvim
    - `<LDR>c` to close the current buffer, instead of AstroNvim's `<LDR>bc`
    - `<LDR>bc` to select a buffer to be closed, instead of AstroNvim's `<LDR>bC`
    - `<LDR>bC` to close every inactive buffers, instead of AstroNvim's `<LDR>bd`
    - `<LDR>tf` to create a floating terminal
    - `<LDR>th` to toggle the 1st terminal horizontally
    - `<LDR>tv` to toggle the 1st terminal vertically
    - `<LDR>t2h` to toggle the 2nd terminal horizontally
    - `<LDR>t2v` to toggle the 2nd terminal vertically
    - `<LDR>t3h` to toggle the 3rd terminal horizontally
    - `<LDR>t3v` to toggle the 3rd terminal vertically
    - `<LDR>fo` to use telescope to find and open recent closed files in cwd
    - `<LDR>fi` to use telescope to find and open recent closed files everywhere
    - `<LDR>bt` does "fullscreen" a buffer, essentially just `:tab split` if `winr('$') != 1`
  - Visual Mode
    - `<LDR>j` twin mapping to `<LDR>j` in normal mode
    - `<S-H>` to `^`
    - `<S-L>` to `$`
  - Insert mode
    - Make `<C-e>`, `<C-y>`, `<C-d>`, and `<C-u>` accessible by binding them to `<esc><C-e/y/d/u>a`
    - Movement with `<C-h>`, `<C-j>`, `<C-k>`, and `<C-l>` without going to normal mode
    - Mapped the unused `<C-b>` shortcut to `<C-o>~<Left>` (flip the next character's case while staying in insert mode)

- Make moving between windows in a terminal easier by allowing these mappings:

  - `<esc>` to `[[<C-\><C-n>]]`
  - `<C-h>`, `<C-j>`, `<C-k>`, and `<C-l>` to just work inside of it

- sets `vim.opt.showtabline = 0`, disables tabline by default

- [`nvim-early-retirement`](https://github.com/chrisgrieser/nvim-early-retirement) to automatically close tabs that are unused

- `catpuccin-mocha` as default theme

- `nvim-telescope/telescope.nvim`

  - Set `initial_mode` default to `normal`.

- `AstroNvim/astrolsp`

  - Disabled inlay hints and autoformat because my laptop literally can't
    handle it

- `ThePrimeagen/harpoon2`

  - Bound `<LDR>k` to `:lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())`
  - Bound `<LDR>a` to `:lua require("harpoon"):list():add()`
  - Bound `<LDR>m` to `:Telescope harpoon marks`
  - Bound `<C-p>` to `:lua require("harpoon"):list():prev()`
  - Bound `<C-n>` to `:lua require("harpoon"):list():next()`
  - Bound `<LDR>1` to `:lua require("harpoon").ui.nav_file(1)`
  - ... until `<LDR>5`

- `vyfor/cord.nvim`

  - Optional discord integration

- `goolord/alpha-nvim`

  - My own custom logo
  - And add harpoon rows on it

- `lukas-reineke/virt-column.nvim`

  - Display a simple line on the 80th col on `BufEnter`

- `xiyaowong/transparent.nvim`

  - `:TransparentEnable`
  - `:TransparentDisable`
  - `:TransparentToggle`
  - Excluded `CursorLine` group from being transparent. I've been having a hard
    time locating where my cursor is placed.

- `folke/drop.nvim`

  - Screensaver-like animation

- `smoka7/hop.nvim`

  - Really quick and easy motion, substitute to `leap.nvim` when I need to
    jump into lines rather than individual words.

- `mason-nvim-dap`

  - Configured debuggers for `go` (`delve`):

    - Configured the debug runners to also include build flags of the specific
      build tags that I use: `test,integration`.

- `kylechui/nvim-surround`

  - Mapped everything `s` to be `,`, e.g. `ys` on normal mode becomes `,`,
    this is done to prevent clashing with the `leap.nvim` motion plugin that
    already preoccupies the `s` key literally everywhere.

  - Removed the following surround keymaps: `insert`, `insert_line`,
    `normal_cur`, `normal_line`, `normal_cur_line`, `visual_line`, and
    `change_line`. Because I personally don't see myself using any of these
    keymaps.

  - Changed how `t` surround works to use `emmet_language_server` to make it
    possible to surround with emmet abbreviations. It does not work when emmet
    is not running on the buffer you're on.

    I might want to implement an else branch where it will restore to be the
    default behavior when emmet is not running on the buffer.

  - Added `e` surround keymap to surround a react fragment. e.g. `,e` on visual
    will surround the selected text with a react fragment (`<></>`). Other
    modifier keymaps like `d,e`, `c,e` also work as usual.

  - Added `j` surround keymap to surround an escape inside a javascript
    template literal. e.g:

    > `|` is the caret

    ```
    console.log(`hello |user.name`)
    ```

    Do `,2ej` and it'll be:

    ```
    console.log(`hello |${user.name}`)
    ```

    I currently have only implemented adding the surrounds, but not editing or
    deleting them yet.

- Heirline

  - Time on the bottom right corner for the status line
  - There was a commit where I implemented a way to make harpoon buffers to
    appear pinned, but the implementation is kind of ugly, so I decided to
    leave it out.

- Copilot

  - Pointed its `node_command` to my local path. you might wanna update this
    on your own.

- And the following community packages:
  ```lua
  return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.completion.codeium-vim" },
    { import = "astrocommunity.quickfix.nvim-bqf" },
    { import = "astrocommunity.motion.nvim-spider" },
    { import = "astrocommunity.motion.leap-nvim" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.media.vim-wakatime" },
    { import = "astrocommunity.split-and-window.mini-map" },
    { import = "astrocommunity.editing-support.dial-nvim" },
    { import = "astrocommunity.markdown-and-latex.vimtex" },
  }
  ```

> Huge thanks to the entire Neovim community and AstroNvim!
