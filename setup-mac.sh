
# MACOS: Update the local OS

softwareupate -ai

# ----------------------------
# Brew: Install Brew
# This will also install xcode if needed
# ----------------------------

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# ----------------------------
# OHMYZSH: Install Oh-My-ZSH
# ----------------------------

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install CORE

brew install git

brew install pyenv
brew install pyenv-virtualenv
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi` >> $HOME/.zprofile
pyenv install 3.10.0
pyenv global 3.10.0
pyenv-activate

brew install cheat
brew install vim

git clone https://github.com/powerline/fonts.git --depth-1
cd fonts
./install.sh
cd ..
rm -rf fonts

git clone https://github.com/dracula/terminal-app.git
open terminal-app/Dracula.terminal
rm -rf terminal-app

brew install iterm2
git clone https://github.com/dracula/iterm.git
open iterm/Dracula.itermcolors
rm -rf iterm

# Ansible FUNKY
# brew install ansible (VS) pip install ansible

# Build Prompt
# PS1=%{%f%b%k%}$(build_prompt)
