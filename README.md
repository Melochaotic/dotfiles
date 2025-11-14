# Setup

> [!NOTE]
> There is a fantastic [Typcraft tutorial](https://typecraft.dev/tutorial/never-lose-your-configs-again) for starting out

## Repo

Clone this repo to your home folder with the default name of `dotfiles` to ensure aliases work.

## GNU Stow

Install [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) using the command for your system:

### Linux (Ubuntu)

Looks like we can use Linuxbrew:

```zsh
brew install stow
```

Otherwise in ubuntu:

```zsh
apt install stow
```

### Mac OS

```zsh
brew install stow
```

## Using

### Symlinks

Generate all the symlinks:

```zsh
stow */
```

...or just generate the ones you need:

```zsh
stow zsh starship git
```

> [!CAUTION]
> In case of conflicts you can add the `--adopt` flag
> to overwrite files in the stow directory
>
> You can then manually manage these before pushing to github

### Init script

run the init script in Linux/Mac to install required packages:

```zsh
zsh init
```

### Git setup

After symlinks are setup you must copy the `.user.gitconfig.example` and fill in the empty settings:

```zsh
cp ~/.user.gitconfig.example ~/.user.gitconfig
nvim ~/.user.gitconfig
```

## Repo aliases

The `aliases.zsh` file contains zsh like git aliases so you can easily commit & check changes anywhere. They use a `dt*` prefix instead of `g*`.

## Tips

### SSH code highlighting

To get colour terminal output in ssh add the following to your `~/.ssh/config` file:

```config
Host *
  SetEnv TERM=xterm-256color
```
