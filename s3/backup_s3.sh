#!/bin/bash

DIR=$1
BUCKET=$2
NOW=$(date +"%Y-%m-%d_%H-%M-%S")
FILE="respaldo_$NOW.tar.gz"
LOGFILE="logs/s3.log"

mkdir -p logs

if [ -z "$DIR" ] || [ -z "$BUCKET" ]; then
  echo "Parámetros incorrectos"
  echo "Uso: ./script.sh <directorio> <bucket>" >> $LOGFILE
  exit 1
fi

if [ ! -d "$DIR" ]; then
  echo "El directorio no existe"
  echo "[$NOW] Error: directorio no existe: $DIR" >> $LOGFILE
  exit 1
fi
