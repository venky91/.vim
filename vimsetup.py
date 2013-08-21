import os


def neobundle_exists():
    bundlePath = os.getenv("HOME") + "/.vim/bundle/neobundle.vim"
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
    print "---------------------"
    print "To install Command-T"
    print "---------------------"
    print "$ cd ~/.vim/bundle/Command-T/ruby/command-t"
    print '$ ruby ext.conf'
    print '$ make'
    print "---------------------"
    print "To install Tern"
    print "---------------------"
    print "$ cd ~/.vim/bundle/tern_for_vim"
    print "$ npm install"
    print "---------------------"
    print "To install YouCompleteMe"
    print "---------------------"
    print "$ cd ~/.vim/bundle/YouCompleteMe"
    print "$ ./install.sh --clang-completer"


#FIX how cd works when used with os.system
def install_command_t():
    os.system('cd ~/.vim/bundle/Command-T/ruby/command-t')
    os.system('/usr/bin/ruby ext.conf')
    os.system('make')
    print "Finished Installing Commmand-T"


def install_clang():
    os.system('cd ~/.vim/bundle/YouCompleteMe')
    os.system('./install.sh --clang-completer')


def install_tern():
    os.system('cd ~/.vim/bundle/tern_for_vim')
    os.system('npm install')


def main():
    neobundle_exists()
    create_symlinks()
    launch_vim_and_install_bundles()
    print end_messages()
    #install_command_t()
    #install_tern()
    #install_clang()

main()
