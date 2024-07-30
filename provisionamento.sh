#!/bin/bash 

echo "Criando diretórios..."

mkdir /publico 
mkdir /adm 
mkdir /ven 
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Instalando o Whois(mkpasswd) para criptografar senhas..."

sudo apt update
sudo apt install whois -y > /dev/null

echo "Criando usuários..."

useradd carlos -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(mkpasswd --method=SHA-512 senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm 
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 700 /adm 
chmod 700 /ven 
chmod 700 /sec
chmod 777 /publico

echo "Fim....."


