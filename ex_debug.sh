#!/usr/bin/env bash
KEYDEBUG=0
LEVEL_DEBUG=0

debugar (){
    [ $1 -le $LEVEL_DEBUG ] && echo "$2"
}

soma(){
  local soma = 0
  for (( i = 0; i <= 20; i++ )); do
    debugar 1 "O valor passado é $i"
    soma=$(($soma+i))
    debugar 2 "A soma é $soma"
  done
}

case $1 in
   -d)  [ -n $2 ] && LEVEL_DEBUG=$2 && KEYDEBUG=1;;
   *) soma;;
esac
[ $KEYDEBUG -eq 1 ] && soma
