# Desafio: Provisionamento de Diretórios e Permissões

Este repositório contém um script Bash desenvolvido como parte do desafio do curso Linux Bootcamp: Trilha de aprendizado rápido [Devs e DevOps]. O objetivo é provisionar diretórios e configurar permissões para usuários e grupos em um sistema Linux.

## Descrição

O script realiza as seguintes ações:
- Criação de diretórios.
- Configuração do usuário root como dono de todos os diretórios criados.
- Concessão de permissão total a todos os usuários no diretório `publico`.
- Concessão de permissão total aos usuários de cada grupo em seu respectivo diretório.
- Restrição de permissão de leitura, escrita e execução para usuários em diretórios de departamentos aos quais não pertencem.

Este projeto faz parte do curso [Linux Bootcamp: Trilha de aprendizado rápido [Devs e DevOps]](https://www.udemy.com/share/1095jW3@262ouoHUrcTijrlGsM636JonZnFSrUtUqHK9g7G3z4pa_nRexlN45xfE9G0QZUNc/)

## Pré-requisitos

- Sistema operacional Linux.
- Acesso root ao sistema.

## Instalação

1. Clone este repositório em sua máquina local:
    ```sh
    git clone https://github.com/beniciont/linux-projeto1-iac

    ```

2. Navegue até o diretório do projeto:
    ```sh
    cd nome-do-repositorio
    ```

## Uso

1. Torne o script executável:
    ```sh
    chmod +x provisionamento.sh
    ```

2. Execute o script:
    ```sh
    sudo ./provisionamento.sh
    ```

## Código do Script

```bash
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
```

## Estrutura dos Diretórios

- `publico/` - Diretório acessível a todos os usuários.
- `departamentoX/` - Diretórios específicos de cada departamento com acesso restrito aos respectivos usuários do grupo.

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Benicio Neto

[![LinkedIn](https://img.shields.io/badge/LinkedIn-000?style=for-the-badge&logo=linkedin&logoColor=0E76A8)](https://www.linkedin.com/in/benicio-neto/)
[![GitHub](https://img.shields.io/badge/GitHub-000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/beniciont)
[![Outlook](https://img.shields.io/badge/Email-000?style=for-the-badge&logo=microsoft-outlook&logoColor=0078D4)](mailto:benicio.neto@outlook.com)

