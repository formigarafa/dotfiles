# NOTE: these instruction may be very outdated
apt-get install -y git neovim tmux rcm nmap
git clone https://github.com/formigarafa/dotfiles.git ~/.dotfiles
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

rcup -v
rm -rf .SpaceVim.d .dotfiles_linux_setup.sh .dotfiles_mac_setup.sh .dotfiles_rpi_setup.sh .gemrc .pryrc

echo "setting up tmux..."
git -C ~/.tmux/plugins/tpm pull || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "setting up neovim..."
curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

