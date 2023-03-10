#!/bin/bash

# Instalando dependencia
apt install gnupg2 -y

# Adicionando apt-key
wget -qO - http://www.bacula.org/downloads/baculum/baculum.pub | apt-key add -

# Adicionando repositorios
echo "deb http://www.bacula.org/downloads/baculum/stable-11/debian bullseye main
deb-src http://www.bacula.org/downloads/baculum/stable-11/debian bullseye main" > /etc/apt/sources.list.d/baculum.list

# Atualizando repositorio
apt update -y

# Instalando baculum api
apt-get install baculum-common baculum-api baculum-api-apache2 -y

# Ativando modulo rewrite
a2enmod rewrite

# Ativando modulo api
a2ensite baculum-api

# Reiniciando apache2
systemctl restart apache2

#Instalando baculum web
apt-get install baculum-common baculum-web baculum-web-apache2 -y

# Ativando mudulo rewrite
a2enmod rewrite

# Ativando modulo web
a2ensite baculum-web

# Reiniciando apache2
systemctl restart apache2
