# dotfiles

Repository dedicated to my .config files  

The general folder contains config that are the same for all the systems like neovim, yazi, starship...

I have decided to use [stow](https://www.gnu.org/software/stow/) in order to manage my dotfiles, so just use this in order to get the dotfiles in it desired path: 

> [!WARNING]  
> Use at your own risks  

```bash
chmod +x stow.sh 
./stow.sh
```

Some day i will create a install file that will download the required packages.
