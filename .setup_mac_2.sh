### SETUP MAC FOR DEVELOPMENT 2 ###
# inspired by: http://sourabhbajaj.com/mac-setup/
# Download this script:
# curl -o ~/.bashrc https://raw.githubusercontent.com/butcallmeJo/.files/master/.setup_mac_2.sh


## Automated Set ups:

# install bash_rc
curl -o ~/.bashrc https://raw.githubusercontent.com/butcallmeJo/.files/master/.bashrc

# Dock Settings
defaults write com.apple.dock workspaces-auto-swoosh -bool NO # Disable auto-switching
killall Dock # Restart the Dock process

# User defaults
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false # enable repeating keys

# Screenshots location
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots/ && killall SystemUIServer # change location

# Install XCode cmd line tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Use apps/programs downloaded thru Homebrew before system defaults
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
# Update homebrew
brew update
# Check Homebrew is all good
brew doctor

# Install Cask
brew tap caskroom/cask

# Install iTerm2
brew cask install iterm2

# Install zsh
brew install zsh
# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# make sure zsh is default shell
chsh -s $(which zsh)
# apply cfg now
source ~/.zshrc

# Install tree
brew install tree

# Install Git
brew install git
git config --global user.name "butcallmejo"
git config --global user.email "josquin.gaillard@gmail.com"
git config --global credential.helper osxkeychain # 

# Install Pyenv / Python
brew install pyenv
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv

# Install Node
brew install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
source ~/.bashrc        # source your bashrc/zshrc to add nvm to PATH
command -v nvm          # check the nvm use message
nvm install node        # install most recent Node stable version
nvm ls                  # list installed Node version
nvm use node            # use stable as current version
nvm ls-remote           # list all the Node versions you can install
nvm alias default node  # set the installed stable version as the default Node

# Install Golang
brew install golang
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOROOT=/usr/local/opt/go/libexec' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc
mkdir -p $GOPATH $GOPATH/src $GOPATH/pkg $GOPATH/bin

# Install alfred
brew cask install alfred

# Install chrome
brew cask install google-chrome

# Install vscode
brew cask install visual-studio-code

# Install cheatsheet
brew cask install cheatsheet

# Install docker
brew cask install docker

# Install spectacle
brew cask install spectacle
