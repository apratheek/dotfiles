# Personal vimrc file

## Steps to install fonts

1. Download NerdFont of your [choice](https://github.com/ryanoasis/nerd-fonts#patched-fonts)
2. Copy the font to `/usr/local/share/fonts/truetype/{font-name}/{font.ttf}`, or to any appropriate directory

```bash
# Careful as this might overwrite existing truetype fonts present in /usr/local/share/fonts
sudo cp -r ../fonts/truetype/ /usr/local/share/fonts/
```
3. Configure terminal to use this font

## Neovim

1. Download [neovim](https://github.com/neovim/neovim/releases) (on linux, as an AppImage).
2. Mark it as executable (chmod +x nvim.appimage).
3. Copy it into `$PATH` and preferably, remove the `.appimage` suffix.
4. Create a directory for neovim's `.vim` file

```bash
mkdir ~/.config/nvim
```

5. Create an optional undo directory if you want persistent undo

```bash
mkdir ~/.config/nvim/undodir
```

6. Install `vim-plug`
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

7. Install Neovim Python Module
```bash
sudo pip3 install --user neovim
sudo pip install --user neovim
```

## Prior dependencies for some plugins

1. `yarn` for coc.nvim
2. `ripgrep` for `fzf`
```bash
# Install via rust
cargo install ripgrep

# Install on Ubuntu >= 18.10
sudo apt install ripgrep
```

## Neovim config
1. Create a symbolic link. Neovim looks for configuration file in `~/.config/nvim/init.vim`

```bash
ln -s ~/Dev/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
```

2. Create a symbolic link for `coc-settings.json`. This is for `coc.nvim`.
```bash
ln -s ~/Dev/dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
```

## Language Servers
1. Docker
```bash
sudo npm install -g dockerfile-language-server-nodejs
```

## Setup for Go
1. Once neovim initializes, run `:GoInstallBinaries` for the first time. Each new neovim open would automatically update the binaries
