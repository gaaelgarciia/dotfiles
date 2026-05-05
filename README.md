# dotfiles

Repository dedicated to my .config file. The main **philosophy** of this rice is to be as least dependant to plugins and external tools as possible, so it can be as used everywere as it can get, while still having all the things that I need. My **workflow** mainly consist in librewolf for browsing + terminal/nvim/tmux for the rest.

The general folder contains config that are the same for all the systems like neovim, yazi, starship...

I have decided to use [stow](https://www.gnu.org/software/stow/) in order to manage my dotfiles, so just use this in order to get the dotfiles in it desired path: 

> [!WARNING]  
> Use at your own risk 

```bash
chmod +x stow.sh 
./stow.sh
```

Some day i will create a install file that will download the required packages for each system (nixos ts).
