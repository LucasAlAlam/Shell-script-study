#!/usr/bin/env bash
#
#	MAKE SCRIPT - Automatiza a criação de scripts
#
#-------------------------------------------------------------------------------
#
# Nome: Lucas Al Alam Ribeiro Silveira
# Email: lucasalalam@protonmail.com
#
#-------------------------------------------------------------------------------
#
#	O programa pode ser usado para automatizar a criação de scripts em diversas
#	linguagens. Este script pode ser utilizado em sistemas Linux.
#
#	Exemplos:
#		$ ./ms.sh -d myprogram.py
#			cria um arquivo .py para ser utilizado em atividades de programação na
#			linguagem Python.
#
#-------------------------------------------------------------------------------
#
#	Histórico:
#		v1.0 2/1/2020 - Lucas
#			- Cria arquivos simples para scripts (cria arquivo e dá permissão de execução)
#		v1.1 2/1/2020 - Lucas
#			- Conta com uma funcionalidade para adicionar cabeçalho automaticamente
#		v1.2 3/1/2020 - Lucas
#			-	Ajuste de variáveis na formatação do arquivo criado pelo script
#		v2.0 4/1/2020 - Lucas
#			- Mudança na lógica do código para aceitar mais de um argumento
#			-	Limpagem de "if's"com inserção de cases e chaves
#		v3.0 4/1/2020 - Lucas
#			- Funcionalidade para criar novo script e atualiza com os dados inseridos
#				nos documentos config, descripton, version
#
#-------------------------------------------------------------------------------
#
#	testado em:
#		bash 5.0.17
#
#-------------------------------------------------------------------------------

echo "MAKE SCRIPT"

#---------------------------VARIÁVEIS-------------------------------------------

NAME="Digite o nome do programa aqui"
SHORT_DESCRIPTION="Digite uma pequena descrição aqui"
AUTOR="Digite seu nome aqui"
SITE="https://meusite.com"
EMAIL="Digite seu email aqui"
MAINTENANCE="Digite os matenedores aqui"
DESCRIPTION="Digite uma descrição detalhada aqui"
EXEMPLE="Digite os exemplos de uso aqui"
HISTORIC="v1.0 - data - name - descripton"
TEST="Digite a versão do bash em que o script foi testado"
TANK="Digite agradecimentos aqui"
KEYHELP=0
HELP="usage: ms [<diretory>/<archive name>]"
KEYMAKE=0
DIRETORY=""
INIT_CONFIG="NAME=$NAME
SHORT_DESCRIPTION=$SHORT_DESCRIPTION
AUTOR=$AUTOR
SITE=$SITE
EMAIL=$EMAIL
MAINTENANCE=$MAINTENANCE
TEST=$TEST
TANK=$TANK
"
INIT_VERSION="Crie um histórico de versões"
INIT_DESCRIPTION="Crie uma descrição do projeto"

#-----------------------------TESTES--------------------------------------------
#----------------------------FUNÇÕES--------------------------------------------
#----------------------------EXECUÇÃO-------------------------------------------

while [[ -n "$1" ]]; do
	case "$1" in
	   	-h)	KEYHELP=1																;;
  --help)	KEYHELP=1																;;
		  -n)	KEYMAKE=1 && shift && DIRETORY=$1				;;
  --name)	KEYMAKE=1 && shift && DIRETORY=$1				;;
		  -u)	KEYUPDATE=1	&& shift && DIRETORY=$1			;;
--update)	KEYUPDATE=1	&& shift && DIRETORY=$1			;;
		   *) echo "Bad usage." && "$HELP" &&	exit 0	;;
	esac
	shift
done

[[ $KEYHELP -eq	1 ]] && echo "$HELP" && exit 0

if [[ $KEYMAKE -eq 1 ]]; then
	mkdir $DIRETORY
	cp -a $(pwd)/$0 $(pwd)/$DIRETORY
	cd $DIRETORY
	echo "$INIT_CONFIG">config
	echo "$INIT_VERSION">version
	echo "$INIT_DESCRIPTION">descripton
	echo "#!/usr/bin/env bash
#-------------------------------NAME--------------------------------------------
#
# $NAME - $SHORT_DESCRIPTION
#
#----------------------------INFORMATION----------------------------------------
#
# Site: $SITE
# Autor: $AUTOR
# Email: $EMAIL
# Maintenance: $MAINTENANCE
#
#----------------------------DESCRIPTION----------------------------------------
#
# $DESCRIPTION
#
#-----------------------------HISTORIC------------------------------------------
#
# $HISTORIC
#
#-------------------------------------------------------------------------------
#
# tested in: $TEST
#
#-------------------------------------------------------------------------------
#
# tank: $TANK
#
#------------------------------------------------------------------------------#

#---------------------------VARIABLES-------------------------------------------



#-----------------------------TEST--------------------------------------------



#----------------------------FUNCTION--------------------------------------------



#----------------------------EXECUTION-------------------------------------------



#-------------------------------------------------------------------------------" > $DIRETORY;
	chmod +x $DIRETORY && exit 0;
fi

if [[ $KEYUPDATE -eq 1 ]]; then
	sed "1,/^#.*#$/d" $DIRETORY > code
	rm $DIRETORY
	NAME="$(cat "config" | grep "NAME" | cut -d "=" -f 2)"
	SHORT_DESCRIPTION="$(cat "config" | grep "SHORT_DESCRIPTION" | cut -d "=" -f 2)"
	AUTOR="$(cat "config" | grep "AUTOR" | cut -d "=" -f 2)"
	SITE="$(cat "config" | grep "SITE" | cut -d "=" -f 2)"
	EMAIL="$(cat "config" | grep "EMAIL" | cut -d "=" -f 2)"
	MAINTENANCE="$(cat "config" | grep "MAINTENANCE" | cut -d "=" -f 2)"
	DESCRIPTION="$(cat "descripton")"
	HISTORIC="$(cat "version")"
	TEST="$(cat "config" | grep "TEST" | cut -d "=" -f 2)"
	TANK="$(cat "config" | grep "TANK" | cut -d "=" -f 2)"

	echo "!/usr/bin/env bash

 $NAME - $SHORT_DESCRIPTION

-------------------------------------------------------------------------------

 Site: $SITE
 Autor: $AUTOR
 Email: $EMAIL
 Maintenance: $MAINTENANCE

-------------------------------------------------------------------------------

 $DESCRIPTION

-------------------------------------------------------------------------------

 Historic: $HISTORIC

-------------------------------------------------------------------------------

 tested in: $TEST

-------------------------------------------------------------------------------

 tank: $TANK

-------------------------------------------------------------------------------#" | sed 's/^/#/' > $DIRETORY
cat code >> $DIRETORY
rm code
chmod +x $DIRETORY
fi

#-------------------------------------------------------------------------------
