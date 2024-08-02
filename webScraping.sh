#!/bin/bash 



curl https://www.vulnhub.com/  >  vulnhubCom.log 2>/dev/null

echo -e "\n[*] Estas son las maquinas disponibles:\n"

cat vulnhubCom.log | grep 'href="/entry/' | tr -d '#' | sed 's/entry/ [+]/' | awk '{print $3}' | tr -d '/' | sed 's/download/ /' | sed 's/"/ /' | tr -d '>' | tr -d ' ' | uniq

cat vulnhubCom.log | grep noob >/dev/null

if [ "$(echo $?)" == "0"  ]; then
	echo -e "\n[-] No se an puesto maquinas nuevas.\n"
else
	echo -e "\n[+] Hay maquina nueva\n"
fi

rm vulnhubCom.log
