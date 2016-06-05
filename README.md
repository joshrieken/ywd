# Yakko Wakko Dotfiles (YWD)

## **(WARNING: this is currently *alpha* status)**

Edgy and opinionated set of dotfiles geared towards (but not exclusive to) terminal-centric web development.

Also, they're zany to the max!

  ![Animaniacs](http://facto-personal.s3.amazonaws.com/github/animaniacs.gif)

# High-Level Overview

* **Terminal, Terminal, Terminal**
    * Designed from scratch and highly optimized for the terminal. Stay where you play.
* **Plugins + lazy-loading == awesome**
    * Continuously updated with the latest and greatest **mature** plugins to aid efficiency. When possible, loading is deferred.
* **Sane defaults++**
    * Contains detailed configuration for the following language-agnostic tools:
        * Neovim
        * Tmux
        * ZSH (built on a [prezto](http://github.com/sorin-ionescu/prezto) base)
        * Git
* **Override and Extend**
* **Supports OS X *and* Linux**
    * OS X
        * Easily install my favorite OS X hacks (**WARNING:** You must understand what all of these are before installing! Check the comments.)
    * Linux

# Installation

* **Highly Recommended:** Remap Caps Lock to **Control**

# Wat

I mostly do web development with Elixir (and Phoenix), Ruby (and Rails), and JavaScript. Having started out in Sublime Text, I found myself wanting to stay in the terminal most of the time, so I tried switching to vim and tmux.

And I failed. I tried again... and again... and AGAIN.

Each time, I found myself retreating back to my old comfortable habits. Terminal land was inexplicably appealing, but it all just felt so... *zany*.

Finally, after the 6th attempt in 4 years, I fully immersed myself in neovim and tmux. Now I'm stuck, more efficient than ever, and, arguably, addicted.

# Neovim

...because it is "[literally the future of vim](https://neovim.io/)".

## Notable Plugins

YWD uses [vim-plug](https://github.com/junegunn/vim-plug) because it's simple, super fast, and supports lazy-loading.

## Autocmds

* When the filetype is `text`, `markdown`, or `ghmarkdown`, wrapping is enabled.

## Bindings

### General

* `<leader>` is `<space>` because it's huge and for RSI reduction (can normally be hit by either thumb)
* `,` is the prefix for EasyMotion

### Movement

* `W` - like `w` but works with CamelCase and snake_case
* `B` - like `b` but works with CamelCase and snake_case
* `E` - like `e` but works with CamelCase and snake_case
* `gr` - like `ge` but works with CamelCase and snake_case

## Notable Plugs

# Credits

Thanks to the following projects for heavy inspiration:

* [skwp/dotfiles](https://github.com/skwp/dotfiles)
* [martin-svk/dot-files](http://github.com/martin-svk/dot-files)
