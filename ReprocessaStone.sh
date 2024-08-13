#! /bin/bash

# Inserir dados do cliente
read -p "Insira um nome para o mapa (Ex: SUPERMERCADO_IDEAL): " NomeMapa
read -p "Insira o CNPJ do cliente sem pontos e traços: " CnpjCliente
read -p "Insira o Stone Code do cliente: " StoneCode
read -p "Insira o id da Caixa Postal do cliente: " IdCaixaPostal
read -p "Insira o número de dias retroativos: " DiasRetroativos
clear

# Variaveis
ConteudoMapa = "[$NomeMapa]
authorization0=$CnpjCliente;$StoneCode;RET.EXT.$StoneCode.390.$IdCaixaPostal"
Arquivo = $NomeMapa.ini

$ConteudoMapa > /home/skyline/operacoes/DEMO.SILVANO/ReprocessamentosStone/$Arquivo







