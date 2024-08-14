#!/bin/bash

#############################################
##                                         ##
## ReprocessaStone.sh                      ##
##                                         ##
## Criado por: Matheus Silvano Pereira     ##
##                                         ##
## Data: 13/08/2024                        ## 
##                                         ## 
#############################################

# Inserir dados do cliente
read -p "Insira um nome para o mapa (Ex: SUPERMERCADO_IDEAL): " NomeMapa
read -p "Insira o CNPJ do cliente sem pontos e traços: " CnpjCliente
read -p "Insira o Stone Code do cliente: " StoneCode
read -p "Insira o id da Caixa Postal do cliente: " IdCaixaPostal
read -p "Insira o número de dias retroativos: " DiasRetroativos

# Variáveis
ConteudoMapa="[$NomeMapa]
authorization0=$CnpjCliente;$StoneCode;RET.EXT.$StoneCode.390.$IdCaixaPostal"  # Conteúdo a ser inserido dentro do mapa para parametrização com a Stone
Arquivo="$NomeMapa.ini"  # Nome do arquivo do mapa
Demo="/home/skyline/operacoes/DEMO.SILVANO/ReprocessamentosStone"  # Caminho para a pasta Demo na operações

echo "Mapa $Arquivo criado!" # Retorna com o Mapa que foi criado
sleep 1

# Criação do Mapa
touch "$Demo/$Arquivo"  # Cria um arquivo de mapa
echo "$ConteudoMapa" >> "$Demo/$Arquivo"  # Adiciona o conteúdo no mapa

# Solicita os arquivos
/home/skyline/scripts/stone/StoneGetFiles.sh.run "$Demo/$Arquivo" -r "$DiasRetroativos"


# Move pra var/spool
cd /home/skyline/scripts/stone/python/reprocessamento  # Abre a pasta de reprocessamento da stone
for i in *RET.EXT.$StoneCode.390.$IdCaixaPostal* ; do mv -v $i /var/spool/nexxera/skyline/recebe/ident/$(basename $i | cut -f1 -d\$) ; sleep 1 ; done  # Manda para a var/spool

echo "Processo finalizado! $DiasRetroativos dias gerados para o Stone Code $StoneCode."







