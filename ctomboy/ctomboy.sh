#!/bin/bash
#Direitos autorais CosmosTI.
#Desevolvido pelo Clube da Tecnologia.
#dev        :guilhermepachecod
#criado     :14/12/2012

#editado por: guilhermepachecod
#editado    : 14/12/2012

#Scrip para configurar a syncro do tomboy tanto para server qt para cliente.


pergunta(){
   echo ""
   echo "Pressione ENTER para voltar"   
   echo ""
   read VOLTAR   
}
server(){
mkdir ~/tomboysync
sudo apt-get install sshfs
}
cliente(){
sudo ssh-keygen -t rsa
scp id_rsa.pub meuusuario@meudominio.com.br:./.ssh/id_rsa.pub
sudo apt-get install sshfs
}
while true
do
   clear
   echo ""
   echo "...::::Programa de instalação e configuração do tomboy:::..."
   echo ""
   echo "1 - Adicionar tomboy servidor;"
   echo "2 - Adicionar tombou cliente"
   echo "3 - Sair."
   echo -ne "\n: "
   read op
 
   case $op in
      1) while true; do
            clear
            server
            pergunta
 
            while [ -n "$VOLTAR" ]; do
               clear
               server
               pergunta
            done
 
            if [ -z "$VOLTAR" ]; then
               break
            fi
         done
         ;;

 2) while true; do
            clear
		cliente
		pergunta
 
            while [ -n "$VOLTAR" ]; do
               clear
               cliente
               pergunta
            done
 
            if [ -z "$VOLTAR" ]; then
               break
            fi
         done
         ;;
 
      3) clear ; echo "" ; echo "Finalizando Programa" ; sleep 1; clear; break
         ;;
 
      *) echo "" ; echo "Opção Inválida" ; sleep 1 ; echo ""
         ;;
   esac
done
