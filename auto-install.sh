#!/bin/sh
# Copied from https://github.com/vgod/vimrc/blob/master/auto-install.sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone --recursive https://github.com/jeremykendall/vim.git "$VIMHOME"

cd "$VIMHOME"
./install-vimrc.sh

echo "vimrc is installed."
