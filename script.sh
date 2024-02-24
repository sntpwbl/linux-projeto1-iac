#!/bin/bash

echo "Criando os grupos:"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando os diretórios e configurando-os de acordo com seus requisitos"
echo "Todos os usuários devem ter permissão total no diretório público"
mkdir /publico 
chmod 777 /publico 

echo "Apenas usuários do grupo podem ter acesso aos diretórios"
mkdir /adm
chown root:GRP_ADM /adm
chmod 770 /adm

mkdir /ven
chown root:GRP_VEN /ven
chmod 770 /ven

mkdir /sec
chown root:GRP_SEC /sec
chmod 770 /sec

echo "Criando os usuários e adicionando-os nos grupos"
useradd carlos -m -s /bin/bash -p $(openssl passwd -1 carlos123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -1 maria123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -1 joao123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -1 debora123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 sebastiana123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -1 roberto123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -1 josefina123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -1 amanda123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -1 rogerio123) -G GRP_SEC


