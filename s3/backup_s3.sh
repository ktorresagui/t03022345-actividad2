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

tar -czf $FILE $DIR

if [ $? -ne 0 ]; then
  echo "Error al comprimir"
  echo "[$NOW] Error al comprimir $DIR" >> $LOGFILE
  exit 1
fi

aws s3 cp $FILE s3://$BUCKET/

if [ $? -ne 0 ]; then
  echo "Error al subir a S3"
  echo "[$NOW] Error al subir $FILE a S3" >> $LOGFILE
  exit 1
fi

echo "[$NOW] Backup subido correctamente: $FILE" >> $LOGFILE

echo " Backup completado correctamente"
