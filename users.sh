#!/bin/bash

# USERS MENU
CONNECTED_USERS="1"
CONNECTED_USERS_NUMBER="2"
IS_CONNECTED_USER="3"
SEND_MESSAGE="4"
BACK="0"

EMPTY_USER=""

echo "USERS"

function printUsersMenu() {
  echo "1: Usuerios conectados"
  echo "2: Numero de usuarios conectados"
  echo "3: ¿Está conectado?"
  echo "4: Enviar mensaje"
  echo "9: Terminar"
}

function executeUsersMenu() {
  read -p "Selecciona alguna de las siguientes opciones: "  selectedMenu

  while [[ ! "$selectedMenu" -eq $BACK ]]; do
    if [[ "$selectedMenu" -eq $CONNECTED_USERS ]]; then
      echo "Usuarios conectados: "
      who -us
    fi
    if [[ "$selectedMenu" -eq $CONNECTED_USERS_NUMBER ]]; then
      echo "El numero de usuarios conectados es: "
      who -q
    fi
    if [[ "$selectedMenu" -eq $IS_CONNECTED_USER ]]; then
       read -p "Ingrese el nombre del objetivo: " connectedUser
       user=$(who|grep $connectedUser)
       echo "$user"     
    fi
    if [[ "$selectedMenu" -eq $SEND_MESSAGE ]]; then
       who
       read -p "Ingrese el nombre del destinatario: " $userMessage
       write $userMessage    
    fi

    printUsersMenu
    read -p "Seleccione una opcion: " selectedMenu
  done
}

printUsersMenu
executeUsersMenu