# GroupsHW
Домашнее задание "Работа с системой Аутентицикации и группой пользователей"
Задание:
Ограничить доступ к системе для всех пользователей, кроме группы администраторов, в выходные дни (суббота и воскресенье), за исключением праздничных дней.
В первую очередь создаём каталог для  нашего проекта.
Устанавливаем Vagrant:
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
Устанавливаем Ansible:
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
Устанаовилваем Virtual Box:
apt install virtualbox
В ней мы так же создаём Vagrantfile, после чего создаём дополнительные каталоги для наших файлов.
Дальше нужно создать наш playbook
Создаём инвентарный файл и сам playbook
Можно ещё создать файл main.yml для общих настроек, но я его создал, но никаких настроек не вписал, т.к. и так работало.
Надо будет ещё написать скрипт проверки доступа login.sh:
По условию задния можно было НЕ учитывать праздничные дни, но я не так интерпритировал задание и, наоборот их включил.
Чтобы не учитывать праздники можно немного редактировать login.sh и убрать файл праздников holiday.sh
После создания каталога и написания скриптов мы запускаем нашу ВМ командой:
vagrant up
И проверяем SSH модуль, после чего мы можем зайти в неё и поменять дату на субботу:
date 030700002026 #7 марта 2026
После чего пытаемся зайти с другого устройтсва (или ВМ) на ВМ vagrant.
Если попытаться зайти через пользователя otus, то зайти не получиться.
otus@192.168.57.10: Permission denied (publickey,password)
Если зайти через otusadm, то вход должен пройти без проблем.
Welcome to Ubuntu 22.04...
Потом проверяем вход otus в будний день - если заходит, то задание выполнено.
Welcome to Ubuntu 22.04...
