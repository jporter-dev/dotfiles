#!/bin/bash

# install homebrew
echo "Installing homebrew..."
if which -s brew != 0 ; then
  # Install Homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed. Updating..."
  brew update
fi

# git
echo "Installing git..."
if which -s git != 0 ; then
  brew install git
else
  echo "Git already installed."
fi


# tmux
echo "Installing tmux..."
if which -s tmux != 0 ; then
  brew install tmux
else
  echo "Tmux already installed."
fi

# fish
echo "Installing fish..."
if which -s fish != 0 ; then
  brew install fish
else
  echo "fish already installed."
fi

# nvm
echo "Installing nvm..."
if which -s nvm != 0 ; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  nvm install stable
else
  echo "nvm already installed."
fi

#rvm
echo "Installing rvm..."
if which -s rvm != 0 ; then
  brew install gnupg
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
else
  echo "rvm already installed."
fi

echo "Installing JDK..."
if java -version ; then
  echo "Java already installed."
else
  brew tap caskroom/cask
  brew cask install java
fi

# copying home folder dotfiles
echo "Copying home folder dotfiles"
for f in ./home/.[^.]*; do
  cp -v $f $HOME
done


# copying fish config
echo "Copying fish config"
rm -rf $HOME/.config/fish
mkdir $HOME/.config/fish
for f in ./home/fish/*; do
  \cp -Rf -v $f $HOME/.config/fish
done

# install fisher stuff if installed packages are less than fishfile
echo "Installing fisher packages..."
if (( $(fish -c 'fisher ls -l | wc -l') < $(cat ./home/fish/fishfile | wc -l) )) ; then
  for f in $( cat ./home/fish/fishfile ); do
    fish -c 'fisher add $f'
  done
fi
