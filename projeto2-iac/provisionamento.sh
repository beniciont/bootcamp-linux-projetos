#! /bin/bash 

echo "Atualizando o Servidor . . ."
sudo apt-get update -y && apt-get upgrade -y > /dev/null

echo "Instalando o Apache2 e o Unzip . . ."
sudo apt install apache2 unzip -y > /dev/null

echo "Baixando e copiando os arquivos da aplicação do repositório no GitHub . . ."
cd /tmp && \
sudo wget https://github.com/beniciont/my-portfolio/archive/refs/heads/main.zip && \
sudo unzip main.zip && \
cd my-portfolio-main && \
sudo cp -R * /var/www/html

echo "Configuração concluída com sucesso!"
