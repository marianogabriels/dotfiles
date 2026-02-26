# My Dotfiles

A personal collection of configuration files for my linux or mac development environment.

## Contents

This repository contains configurations for the following tools:

*   **Shell**: Zsh, configured with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
*   **Editor**: Neovim (Lua-based configuration)
*   **Terminal**:
*   Tmux
*   Urxvt (with a clipboard extension)
*   **Window Manager**: i3wm with i3status
*   **Others**:
*   `zprofile` and `zshrc` for shell configuration.
*   `Xresources` and `xinitrc` for the graphical environment.
*   `gemrc` for RubyGems.

## Installation

### Prerequisites

Ensure you have the following tools installed before proceeding:

*   `zsh`
*   `i3wm`
*   `neovim`
*   `tmux`
*   `rake`
*   `git`
*   `curl`

### Steps

The installation is managed via a `Rakefile`.

1.  **Clone this repository:**
    ```bash
    git clone https://github.com/marianos/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ```

2.  **Run the installation task:**
    ```bash
    rake install
    ```
    This command will:
    *   Install **Oh My Zsh** and **fzf** (a command-line fuzzy finder).
    *   Prompt to switch your default shell to `zsh`.
    *   Install [vim-plug](https://github.com/junegunn/vim-plug) to manage Neovim plugins.
    *   Create symbolic links in your `HOME` directory for the configuration files in this repository (e.g., `~/.zshrc`, `~/.tmux.conf`, etc.).
    *   Link the Neovim configuration to `~/.config/nvim`.

3.  **Manual Step for Urxvt (Optional):**
    If you use `urxvt`, copy the clipboard script to its extension directory:
    ```bash
    cp clipboard /usr/lib/urxvt/perl/
    ```
