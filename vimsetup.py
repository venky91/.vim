import os

def check_vundle():
    vundlePath = os.getenv("HOME") + "/.vim/bundle/vundle"
    print vundlePath
    if os.path.exists(vundlePath):
        print "Vundle Exists"
    else:
        print "Installing Vundle"
        os.system('git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle')
        print "Finished installing Vundle"

def create_symlinks():
    print "Creating symlinks."
    os.system('ln -s ~/.vim/.vimrc ~/.vimrc')
    os.system('ln -s ~/.vim/.gvimrc ~/.gvimrc')

def launch_vim_and_install_bundles():
    print "Installing Bundles"
    os.system('vim +BundleInstall +qall')

def main():
    check_vundle()
    create_symlinks()
    launch_vim_and_install_bundles()

main()
