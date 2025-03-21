#!/bin/bash

echo "Iniciando provisionamento do servidor web..."

# Atualizar o sistema
echo "Atualizando o sistema..."
apt update
apt upgrade -y

# Instalar o Apache e pacotes complementares
echo "Instalando o servidor web Apache..."
apt install apache2 -y
apt install unzip -y

# Habilitar e iniciar o serviço Apache
echo "Configurando o serviço Apache..."
systemctl enable apache2
systemctl start apache2

# Baixar e descompactar os arquivos da aplicação web de exemplo
echo "Baixando e configurando aplicação web de exemplo..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/

# Configurar permissões
echo "Configurando permissões..."
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Configurações de segurança básicas para o Apache
echo "Aplicando configurações de segurança..."
echo "ServerTokens Prod" >> /etc/apache2/apache2.conf
echo "ServerSignature Off" >> /etc/apache2/apache2.conf

# Reiniciar o Apache para aplicar todas as configurações
echo "Reiniciando o servidor Apache..."
systemctl restart apache2

# Verificar status do serviço
echo "Verificando status do servidor web..."
systemctl status apache2

echo "Provisionamento do servidor web concluído com sucesso!"
echo "Acesse o servidor através do endereço IP ou nome do host no navegador"