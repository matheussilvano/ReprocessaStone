#! /bin/bash

# Inserir dados do cliente
read -p "Insira um nome para o mapa (Ex: SUPERMERCADO_IDEAL): " NomeMapa
read -p "Insira o CNPJ do cliente sem pontos e traços: " CnpjCliente
read -p "Insira o Stone Code do cliente: " StoneCode
read -p "Insira o id da Caixa Postal do cliente: " IdCaixaPostal
read -p "Insira o número de dias retroativos: " DiasRetroativos

# Variaveis
ConteudoMapa = "[$NomeMapa]
authorization0=$CnpjCliente;$StoneCode;RET.EXT.$StoneCode.390.$IdCaixaPostal"
Arquivo = $NomeMapa.ini
Demo = home/skyline/operacoes/DEMO.SILVANO/ReprocessamentosStone

touch $Demo/$Arquivo
$ConteudoMapa >> $Demo/$Arquivo

/home/skyline/scripts/stone/StoneGetFiles.sh.run $Demo/$Arquivo -r $DiasRetroativos

cd /home/skyline/scripts/stone/python/reprocessamento

for i in *RET.EXT.$StoneCode.390.$IdCaixaPostal* ; do mv -v $i /var/spool/nexxera/skyline/recebe/ident/$(basename $i | cut -f1 -d\$) ; sleep 1 ; done







