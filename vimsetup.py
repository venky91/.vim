import os


def neobundle_exists():
    bundlePath = os.getenv("HOME") + "/.vim/neobundle.vim"
    print bundlePath
    if os.path.exists(bundlePath):
        print "NeoBundle Exists"
    else:
        print "Installing NeoBundle"
        os.system('git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim')
        print "Finished installing NeoBundle"


def create_symlinks():
    print "Creating symlinks."
    os.system('ln -s ~/.vim/.vimrc ~/.vimrc')
    os.system('ln -s ~/.vim/.gvimrc ~/.gvimrc')


def launch_vim_and_install_bundles():
    print "Installing Bundles"
    os.system('vim +NeoBundleInstall +q')


def end_messages():
    print "Check YouCompleteMe"


def main():
    neobundle_exists()
    create_symlinks()
    launch_vim_and_install_bundles()
    print end_messages()

main()
