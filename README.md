# My personal configuration files

## Setup Instructions

```
cd $HOME
git init .
git config --local status.showUntrackedFiles no
git remote add origin https://github.com/noseka1/rcfiles.git
git fetch
git checkout master
```

```
echo 'source $HOME/.bashrc.in' >> .bashrc
```

Install vim plugins

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/71c41fccf5ca42081d4d49aa1ea2f71c694bc4cf/plug.vim
vim -c PlugInstall -c qall!
```

Install tmux plugins

```
git clone --branch v3.0.0 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
```
