ansible-playbook -i ~/ansible/desktop_hosts ~/ansible/playbook.yml -K
<br>
ansible-playbook -i ~/ansible/laptop_hosts ~/ansible/playbook.yml -K
<br>
if termux:
<br>
proot-distro login archlinux --bind ~/storage:/mnt
<br>
su - asdf
<br>
ansible-playbook -i ~/ansible/termux/hosts ~/ansible/termux/playbook.yml
