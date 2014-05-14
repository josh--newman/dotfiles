#!/bin/bash
# creates symlinks from home directory to dotfiles in ~/dotfiles
# courtesy: github.com/michaeljsmalley/dotfiles

# before
# \curl -L http://install.ohmyz.sh | sh
# \wget --no-check-certificate http://install.ohmyz.sh -O - | sh

dir=~/.dotfiles        # dotfiles directory
olddir=~/.dotfiles_old # old dotfiles backup directory

# list of files to symlink in homedir
files="aliases exports zshrc"

# create backup directory
echo "Creating $olddir for backup of existing dotfiles ..."
if [ ! -d $olddir ]; then
    mkdir -p $olddir
fi
echo "...done"

cd $dir

# move existing dotfiles in ~ to backup directory
# create symlinks from ~ to files in ~/dotfiles specified in $files
echo "Moving existing dotfiles to $olddir"
for file in $files; do
    if [ ! -f ~/.$file ]; then
      echo "No file to move: $file"
    else
      mv ~/.$file $olddir/$file
    fi
    echo "Creating symlink to $file in $HOME"
    ln -s $dir/$file ~/.$file
done

# link zsh theme
echo "Linking theme to $HOME/.oh-my-zsh/themes..."
rm ~/.oh-my-zsh/themes/joshnewman.zsh-theme
ln -s ~/.dotfiles/joshnewman.zsh-theme ~/.oh-my-zsh/themes
echo "...done"
