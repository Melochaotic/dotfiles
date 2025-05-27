# Setup

> [!NOTE]
> There is a fantastic [Typcraft tutorial](https://typecraft.dev/tutorial/never-lose-your-configs-again) for starting out

## Repo

Clone this repo to your home folder with the default name of `dotfiles` to ensure aliases work.

## GNU Stow

Install [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) using the command for your system:

### Linux (Ubuntu)

```zsh
apt install stow
```

### Mac OS

```zsh
brew install stow
```

## Using

Finally generate all the symlinks:

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

### Git setup

After symlinks are setup you must copy the `.user.gitconfig.example` and fill in the empty settings:

```bash
cp ~/.user.gitconfig.example ~/.user.gitconfig
nvim ~/.user.gitconfig
```

## Repo aliases

The `.zsh_aliases` file contains zsh like git aliases so you can easily commit & check changes anywhere. They use a `dt*` prefix instead of `g*`.
