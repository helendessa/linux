# Projeto de Infraestrutura Linux

## Estrutura do Projeto

### Diretórios
- /publico - Diretório público com permissão total para todos (777)
- /adm - Diretório para equipe administrativa (770)
- /ven - Diretório para equipe de vendas (770)
- /sec - Diretório para equipe de secretariado (770)

### Grupos
- GRP_ADM - Grupo dos usuários administrativos
- GRP_VEN - Grupo dos usuários de vendas
- GRP_SEC - Grupo dos usuários de secretariado

### Usuários
- GRP_ADM: carlos, maria, joao
- GRP_VEN: debora, sebastiana, roberto
- GRP_SEC: josefina, amanda, rogerio

## Script de Automação

```bash
#!/bin/bash

echo "Iniciando configuração da infraestrutura..."

# Criando diretórios
echo "Criando diretórios..."
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

# Criando grupos de usuários
echo "Criando grupos de usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando usuários e adicionando aos grupos
echo "Criando usuários..."

# Usuários do grupo ADM
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

# Usuários do grupo VEN
useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

# Usuários do grupo SEC
useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

# Configurando permissões dos diretórios
echo "Configurando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# Definindo permissões
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Configuração concluída com sucesso!"