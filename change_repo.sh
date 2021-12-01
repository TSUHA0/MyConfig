#this is sh applicable to ubuntu 20.04

echo "------- Switch to USTC Repo -------"
mv /etc/apt/sources.list /etc/apt/sources.list.bak


echo '

deb https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse

deb https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse

deb https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse

deb https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse

' > /etc/apt/sources.list


sudo apt-get update
echo "------- Repo changed and Updated -------"
