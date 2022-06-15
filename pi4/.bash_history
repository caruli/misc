sudo mount -t vfat  /dev/sdx /mnt/ -o umask=007,uid=1000,gid=1000 # mount usb with pi permissions
sudo mount -t ntfs-3g -o rw,uid=1000,gid=1000,dmask=022 -L label /media # mount hd 
sudo apt install git libxft-dev   # minimum buster packages
sudo mkfs.fat -F 32 -I -n  'verbatin' /dev/sdx # format fat32
sudo apt install xserver-xorg x11-xserver-utils xinit # minimal X window gui
sudo apt remove xterm # not needed packages
wget https://raw.githubusercontent.com/caruli/bash_aliases/master/.bashrc # one file only from github
git clone https://github.com/bontibon/kjv.git
git clone git://git.sv.gnu.org/emacs.git
git clone --depth 1 https://gitlab.com/protesilaos/dotfiles.git ~/Git/prot-dotfiles # prot gitlab
git clone https://oldgit.suckless.org/2wm
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/surf
patch -p1 < # patches suckless
unzip -p *.zip | sudo dd of=/dev/sdx bs=4M conv=fsync status=progress  # make image
sudo dd bs=4M if=.iso of=/dev/sdX conv=fdatasync  status=progress # iso
sudo ntfslabel -f /dev/sda1  new_label # change ntfs label name
pkill emacs     # process kill signal by name
apk add gst-plugins-good # surf-2.0 for playing videos on youtube
apk add gst-libav # surf-2.0 for playing videos on youtube
wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash  # install pi-apps
dpkg-query --show | more  # show packages buster
sudo apt --purge autoremove  # remove all undeded packages
git clone https://bitbucket.org/sol_prog/raspberry-pi-gcc-binary.git # gcc-10.1.0-armhf binaries
sudo apt install git autoconf texinfo libgtk-3-dev libgccgit-10-dev gnutls-dev libncurses-dev # emacs libraries 64bit bullseye raspberry
./configure --prefix=/usr --with-native-compilation --without-ns --without-x --with-pgtk --with-xml2 --with-gnutls  --with-rsvg  --disable-silent-rules --without-dbus  --with-modules --with-cairo CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer" # configure pgtk
grep    < pk_history | sh -  # search and execute
goto-init # C-c d
dired # C-x d
split-window-horizontally # C-|
find-file-other-window # C-c f
hippie-expand # M-/
delete-blank-lines # C-x C-o
kill-current-buffer # C-q
kill-next-buffer # C-x k
mark-whole-buffer # C-x h
delete-trailing-whitespace # C-c w
monocle-view # C-c m Toggle between multiple windows and single window
count-words # M-=
just-one-space # M-SPC delete all spaces and tabs around point, leaving one space
backword-kill-word # M-<delete>
kill-line-backward # M-k
org-comment-dwim C-; # comment org headings
sudo dpkg-reconfigure keyboard-configuration # keyboard setup raspberry debian

