#!/bin/bash

TIME="1"
EXEC_PATH="2"
CHANGE_PASSWORD="3"
FREE_SPACE="4"
USED_SPACE="5"
PLIST="6"
EXIT="9"

echo "MENU"

function printCommandsMenu() {
  echo "Selecciona alguna opción"
  echo "1) Hora del sistema"
  echo "2) Ruta del script"
  echo "3) Cambiar contraseña"
  echo "4) Disco libre"
  echo "5) Disco ocupado"
  echo "6) Ver procesos activos"
  echo "9) Salir"
}

function executeCommandsMenu() {
  printCommandsMenu
  read selectedMenu

  while [[ ! "$selectedMenu" -eq $EXIT ]]; do
    if [[ "$selectedMenu" -eq $TIME ]]; then
      date
    fi
    if [[ "$selectedMenu" -eq $EXEC_PATH ]]; then
      pwd
    fi
    if [[ "$selectedMenu" -eq $CHANGE_PASSWORD ]]; then
      passwd
    fi
    if [[ "$selectedMenu" -eq $FREE_SPACE ]]; then
      df -h
    fi
    if [[ "$selectedMenu" -eq $USED_SPACE ]]; then
      du -h
    fi
    if [[ "$selectedMenu" -eq $PLIST ]]; then
      ps -aux | more
    fi
    if [[ "$selectedMenu" -eq $EXIT ]]; then
      exit
    fi

    printCommandsMenu
    read selectedMenu
  done
}

executeCommandsMenu