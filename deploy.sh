#!/bin/bash

if [ -f config/config.env ]; then
    source config/config.env
fi

accion=$1
instancia=${2:-$INSTANCE_ID}
carpeta=${3:-$DIRECTORY}
bucket=${4:-$BUCKET_NAME}

log="logs/ejecucion.log"
mkdir -p logs

if [ -z "$accion" ] || [ -z "$instancia" ] || [ -z "$carpeta" ] || [ -z "$bucket" ]; then
    echo "Parametros incompletos" >> $log
    echo "Uso: ./deploy.sh accion instance_id directorio bucket"
    exit 1
fi

echo "Inicio: $(date)" >> $log

echo "Ejecutando EC2..." >> $log
python3 ec2/gestionar_ec2.py $accion $instancia
if [ $? -ne 0 ]; then
    echo "Fallo en EC2" >> $log
    exit 1
fi

echo "Ejecutando backup S3..." >> $log
bash s3/backup_s3.sh $carpeta $bucket
if [ $? -ne 0 ]; then
    echo "Fallo en S3" >> $log
    exit 1
fi


echo "Fin: $(date)" >> $log
echo "Deploy completado correctamente "
