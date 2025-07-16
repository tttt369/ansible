ansible-playbook -i ~/ansible/desktop_hosts ~/ansible/playbook.yml -K
<br>
ansible-playbook -i ~/ansible/laptop_hosts ~/ansible/playbook.yml -K
<br>
if termux:
<br>
pkg update
<br>
termux-setup-storage
<br>
pkg install proot-distro
<br>
proot-distro install archlinux
<br>
proot-distro login archlinux --bind ~/storage:/mnt
<br>
ansible-playbook -i ~/ansible/termux/hosts ~/ansible/termux/playbook.yml
