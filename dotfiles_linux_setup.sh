# NOTE: these instruction may be very outdated
git clone https://github.com/formigarafa/dotfiles.git ~/.dotfiles

# linux
apt-get install -y git-core curl build-essential
apt-get install -y ruby-dev neovim
apt-get install -y keychain
curl -sLf https://spacevim.org/install.sh | bash
pip install powerline-shell
curl -LO https://thoughtbot.github.io/rcm/dist/rcm-1.3.0.tar.gz && \
\
sha=$(sha256sum rcm-1.3.0.tar.gz | cut -f1 -d' ') && \
[ "$sha" = "ddcf638b367b0361d8e063c29fd573dbe1712d1b83e8d5b3a868e4aa45ffc847" ] && \
\
tar -xvf rcm-1.3.0.tar.gz && \
cd rcm-1.3.0 && \
\
./configure && \
make && \
sudo make install
