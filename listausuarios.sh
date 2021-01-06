#!/usr/bin/env bash
#
#	listausuarios.sh - Lisa os usuários do sistema
#
#-------------------------------------------------------------------------------
#
#	Autor: Lucas Al Alam Ribeiro Silveira
#	Email: lucasalalam@protonmail.com
#	Mantenedor: Lucas Al Alam Ribeiro Silveira
#
#-------------------------------------------------------------------------------
#
#	Este programa irá listar os usuários de um sistema linux a partir do arquivo
# /etc/passwd com opção de ordena-los em ordem alfabética e deixar a saída
# apenas com caracteres maiúsculos
#
#	Exemplos:
#     $ ./listausuarios -s -m
#       - Este comando lista os usuários do sistema em maiúsculo e em ordem
#         alfabética
#
#-------------------------------------------------------------------------------
#
#	Histórico:
# v1.0 - 3/1/2020 - Lucas
#   - Inicio do desenvolvimento
#   v1.1 - 3/1/2020 - Lucas
#     - Adição dos parâmetros -h, -v, -u e -s
# v2.0 - 3/1/2020 - Lucas
#   - Troca na lógica do programa para introdução de chaves
#   v2.1 - 3/1/2020 - Lucas
#     - Adiciona funcionalidade para adição de mais de um parâmetro
#     - Tratamento de erros
#
#-------------------------------------------------------------------------------
#
#	testado em: bash 5.0.17
#
#-------------------------------------------------------------------------------
#
#	Agradecimentos: Aos cursin pirata do Telegram
#
#-------------------------------------------------------------------------------

#---------------------------VARIÁVEIS-------------------------------------------

USERS="$(cat /etc/passwd | cut -d : -f 1)"
USAGE="
$(basename $0) [OPTIONS]

  -h --help
    - help
  -v --verbose
    - version
  -s  --sort
    order output
  -u --upper-case
    upper case
"
VERSION="v1.0"
KEYUPPER=0
KEYSORT=0

#----------------------------EXECUÇÃO-------------------------------------------

while [[ -n "$1" ]]; do
  case $1 in
    -h) echo "$USAGE" && exit 0             ;;
    -v) echo "$VERSION" && exit 0           ;;
    -s) KEYSORT=1                           ;;
    -u) KEYUPPER=1                          ;;
     *) echo "Bad Usage. $USAGE" && exit 1  ;;
  esac
  shift
done
[ $KEYSORT -eq 1 ] && USERS=$(echo "$USERS" | sort)
[ $KEYUPPER -eq 1 ] && USERS=$(echo "$USERS" | tr [a-z] [A-Z])
echo "$USERS"

#-------------------------------------------------------------------------------
