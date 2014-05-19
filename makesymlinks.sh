#!/bin/bash
# creates symlinks from home directory to dotfiles in ~/dotfiles
# courtesy: github.com/michaeljsmalley/dotfiles

# before
# \curl -L http://install.ohmyz.sh | sh
# \wget --no-check-certificate http://install.ohmyz.sh -O - | sh

dir=~/.dotfiles        # dotfiles directory

# link zshrc
echo "Linking .zshrc to $dir/zshrc..."
rm $HOME/.zshrc
ln -s $dir/zshrc ~/.zshrc
echo "...done"

# link zsh theme
echo "Linking theme to $HOME/.oh-my-zsh/themes..."
rm ~/.oh-my-zsh/themes/joshnewman.zsh-theme
ln -s $dir/joshnewman.zsh-theme ~/.oh-my-zsh/themes
echo "...done"

# link scripts to bin/
scripts="git webcamsnapshot"

for script in $scripts; do
    echo "Creating symlink to $script in /bin"
    sudo rm -rf /bin/$script
    sudo ln -s $HOME/.dotfiles/scripts/$script /bin/$script
    echo "...done"
done
