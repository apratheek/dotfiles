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

## Neovim config
1. Create a symbolic link. Neovim looks for configuration file in `~/.config/nvim/init.vim`

```bash
ln -s init.vim ~/.config/nvim/init.vim
```

## Prior dependencies for some plugins

1. `yarn` for coc.nvim