# Neovim

## Notable Plugins

We use [vim-plug](https://github.com/junegunn/vim-plug) because it's simple, super fast, and supports lazy-loading.

## Cheatsheets

### Autocmds

* When the filetype is `text`, `markdown`, or `ghmarkdown`, wrapping is enabled.

### Functional Improvement Mappings

* `<leader>` is `<space>` because it's huge, can be hit with either hand, and reduces RSI.
* `,` is the prefix for EasyMotion

### Interface Mappings

* `<C-\>` toggles NERDTree (works smoothly with tabs)
* `<leader>\` opens NERDTree navigated to the current file

### Movement & Search Bindings

* `W` - like `w` but works with CamelCase and snake_case
* `B` - like `b` but works with CamelCase and snake_case
* `E` - like `e` but works with CamelCase and snake_case
