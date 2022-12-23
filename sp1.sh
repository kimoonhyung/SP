!/bin/bash
echo ""
echo "Автор: Дубская Наталия, 728-2"
echo "Программа: sp1.sh"
echo "Данная программа позволяет подключать и отключать репозитории"
echo ""

while :
do

echo "Списк настроенных репозиториев:"
reposs=$(ls /etc/yum.repos.d/)
echo "$reposs"

echo ""
read -p "Введите названия репозитория из списка (например: epel): " repo
di=$(yum repolist enabled $repo)
st="$(echo $di | rev | cut -d" " -f1 | rev)"

if [ -e /etc/yum.repos.d/$repo.repo ]
then

if [ $st = "0" ]
then
r=$(yum-config-manager --enable $repo)
echo "Репозиторий был подключен"
else
r=$(yum-config-manager --disable $repo)
echo "Репозиторий был отключен"
fi

else
echo "Репозиторий не найден"
fi

echo ""
read -p "Начать выполнение сначала? (д/н): " cont
if [ $cont = "д" ]
then
echo ""
else
echo "Завершение работы программы"
break
fi

done
