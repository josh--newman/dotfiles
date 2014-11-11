#!/bin/bash
# creates symlinks from home directory to dotfiles in ~/dotfiles
# courtesy: github.com/michaeljsmalley/dotfiles

# before
# \curl -L http://install.ohmyz.sh | sh
# \wget --no-check-certificate http://install.ohmyz.sh -O - | sh

dir=$HOME/.dotfiles        # dotfiles directory

# hush login
echo "++ Adding ~/.hushlogin"
touch ~/.hushlogin

dotfiles=(zshrc gitconfig)
for file in ${dotfiles[@]}; do
  echo "-- Removing existing .${file}"
  rm "$HOME/.${file}"
  echo "++ Symlinking .${file}"
  ln -s $dir/$file "$HOME/.${file}"
done
unset file

# link zsh theme
echo "-- Removing existing joshnewman.zsh-theme"
rm ~/.oh-my-zsh/themes/joshnewman.zsh-theme
echo "++ Symlinking joshnewman.zsh-theme"
ln -s $dir/joshnewman.zsh-theme ~/.oh-my-zsh/themes
echo "...done"
