# NOTE: these instruction may be very outdated
# linux
apt-get install -y git-core curl build-essential
apt-get install -y neovim
apt-get install -y tmux xclip 
apt-get install -y direnv
git clone https://github.com/formigarafa/dotfiles.git ~/.dotfiles

mkdir /home/raf/.SpaceVim.d
ln -s /home/raf/.dotfiles/SpaceVim.d/init.toml /home/raf/.SpaceVim.d/
ln -fs /home/raf/.dotfiles/bashrc /home/raf/.bashrc
ln -s /home/raf/.dotfiles/gitconfig /home/raf/.gitconfig
ln -s /home/raf/.dotfiles/tmux.conf /home/raf/.tmux.conf
ln -s /home/raf/.dotfiles/inputrc /home/raf/.inputrc
ln -s /home/raf/.dotfiles/pry /home/raf/.pry
ln -s /home/raf/.dotfiles/pryrc /home/raf/.pryrc
ln -s /home/raf/.dotfiles/git-prompt-colors.sh /home/raf/.git-prompt-colors.sh

git -C ~/.tmux/plugins/tpm pull || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

curl -sLf https://spacevim.org/install.sh | bash
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

curl -o ~/Downloads/Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono.ttf https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf

# ros stuff
apt-get install -y gcc make perl dkms

