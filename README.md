Personal vim configuration
==========================

One step installation
---------------------

Use curl (for Mac OS X):

     curl -o - https://raw.github.com/jeremykendall/vim/master/auto-install.sh | sh

or wget (for most UNIX platforms):

     wget -O - https://raw.github.com/jeremykendall/vim/master/auto-install.sh | sh


Manual installation
-------------------

1. Check out from github

        git clone git://github.com/vgod/vimrc.git ~/.vim
        cd ~/.vim
        git submodule update --init

2. Install ~/.vimrc and ~/.gvimrc

        ./install-vimrc.sh


Manual Windows installation
---------------------------

1. Check out from github

        cd C:\Program Files\Vim   (or your installed path to Vim)
        rmdir /s vimfiles         (This deletes your old vim configurations. If you want to keep it, use move instead of rmdir.)
        git clone git://github.com/vgod/vimrc.git vimfiles
        git submodule update --init

2. Install vimrc. Add the following line at the end of C:\Program Files\Vim\vimrc.

        source $VIM/vimfiles/vimrc

  
Install/Upgrade plugin bundles
------------------------------

All plugins (to date) were checked out as git submodules, 
which can be upgraded with `git pull`. For example, to upgrade vim-fugitive

     cd ~/.vim/bundle/vim-fugitive
     git pull

To install a new plugin as a git submoudle, type the following commands.

     cd ~/.vim
     git submodule add [GIT-REPOSITORY-URL] bundle/[PLUGIN-NAME]


Credits
-------

This README file and the installation scripts were copied word for word from
Tsung-Hsiang (Sean) Chang's excellent [vimrc repo](https://github.com/vgod/vimrc).

The majority of the content of my vimrc file came from Matthew Weier O'Phinney
and Steve Losh, who were kind enough to share their years of experience with vim
on their blogs.

* [Vim Toolbox, 2010
  Edition](http://mwop.net/blog/249-Vim-Toolbox,-2010-Edition) by MWOP
* [Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/) by
  Steve Losh

Finally, thanks to all my friends on Twitter who recommended the 
[Solarized](http://ethanschoonover.com/solarized) color scheme.  If you haven't
tried it, it's amazing.
