unset HISTFILE
alias hs='history'
alias hsr='history -r pk_history'
alias ec='emacsclient -c '
alias ed='emacs --daemon'
alias egrep='egrep --color=auto'
alias enw='emacs -nw'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lsblk='lsblk -o name,size,mountpoint,label' # show disk's labels
alias ll='ls -l /dev/disk/by-label' # show disk labels with ls cmd
sudo mount -t vfat  /dev/sdx1 /mnt/ -o uid=1000,gid=1000 # mount usb with pi permissions
sudo mount -t ntfs-3g -o rw,uid=1000,gid=1000,dmask=022 /dev/sdx /media # ntfs permission
sudo apt install git libxft-dev   # minimum buster packages
sudo apt install xserver-xorg x11-xserver-utils xinit # minimal X window gui
sudo apt remove xterm # not needed packages
git clone --depth 1 git://git.savannah.gnu.org/emacs.git
git clone --depth 1 https://gitlab.com/protesilaos/dotfiles.git ~/Git/prot-dotfiles # prot gitlab
git clone https://oldgit.suckless.org/2wm
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/surf
unzip -p *.zip | sudo dd of=/dev/sdx bs=4M conv=fsync status=progress  # make image
pkill emacs     # process kill signal by name
sudo mount.exfat /dev/sdx  /mnt  # SD card 64GB  mount in USB flash stick
apk add gst-plugins-good # surf-2.0 for playing videos on youtube
apk add gst-libav # surf-2.0 for playing videos on youtube
wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash  # install pi-apps
dpkg-query --show | more  # show packages buster
sudo apt --purge autoremove  # remove all undeded packages
git clone https://bitbucket.org/sol_prog/raspberry-pi-gcc-binary.git # gcc-10.1.0-armhf binaries
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

