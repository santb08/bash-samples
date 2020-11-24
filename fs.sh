#!/bin/bash

CREATE_DIRECTORY="1"
COPY_FILES="2"
MODIFY_PERMISSIONS="3"
SHOW_FILE_CONTENT="4"
REMOVE_FILE="5"
CHANGE_FILE_NAME="6"
DELETE_DIRECTORY="7"
EXIT="9"

echo "FILE SYSTEM MENU"

function printFileSystemMenu() {
  echo "1) Crear directorio"
  echo "2) Copiar archivo"
  echo "3) Modificar permisos"
  echo "4) Mostrar contenido del archivo"
  echo "5) Borrar archivo"
  echo "6) Cambiar nombre de archivo"
  echo "7) Borrar directorio"
  echo "9) Regresar"
}

function executeFileSystemMenu() {
  read -p "Selecciona alguna de las siguientes opciones sobre tu sistema: " selectedMenu

  while [[ ! "$selectedMenu" -eq $EXIT ]]; do
    if [[ "$selectedMenu" -eq $CREATE_DIRECTORY ]]; then
      read -p "Ingresa el directorio que quieres crear: " directory

      if test -d $directory; then
        echo "El directorio ya existe"
      else
        mkdir -p "$directory"
      fi
    fi
    if [[ "$selectedMenu" -eq $COPY_FILES ]]; then
      read -p "Ingresa el archivo a copiar: " file
      read -p "Ingresa la carpeta donde se va a copiar el archivo: " cpdirectory

      if test -f $file && test -d $cpdirectory; then
        cp $file $cpdirectory
      else
        echo "Ingrese un archivo y un directorio valido"
      fi
    fi
    if [[ "$selectedMenu" -eq $MODIFY_PERMISSIONS ]]; then
       bash permissions.sh
    fi
    if [[ "$selectedMenu" -eq $SHOW_FILE_CONTENT ]]; then
      read -p "Ingrese el archivo a mostrar: " printFile

      if test -f $printFile; then
        cat $printFile
      else
        echo "El archivo $printFile no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $REMOVE_FILE ]]; then
      read -p "Ingrese el archivo a eliminar: " fileToRemove

      if test -f $fileToRemove; then
        rm $fileToRemove
      else
        echo "El archivo $fileToRemove no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $CHANGE_FILE_NAME ]]; then
      read -p "Ingrese el archivo a cambiar nombre: " fileToChange
      read -p "Ingrese el nuevo nombre: " newName

      if test -f $fileToChange; then
        mv $fileToChange $newName
      else
        echo "El archivo $fileToChange no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $DELETE_DIRECTORY ]]; then
      read -p "Ingrese el directorio a borrar: " directoryToRemove

      if test -d $directoryToRemove; then
        rm -r $directoryToRemove
      else
        echo "El directorio $directoryToRemove no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $EXIT ]]; then
      exit
    fi

    printFileSystemMenu
    read -p "Seleccione una opcion: " selectedMenu
  done
}

printFileSystemMenu
executeFileSystemMenu