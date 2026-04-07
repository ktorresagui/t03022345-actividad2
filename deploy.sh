#!/bin/bash

accion=$1
instancia=$2
carpeta=$3
bucket=$4

if [ -z "$accion" ] || [ -z "$instancia" ]; then
    echo "Uso: ./deploy.sh accion instance_id"
    exit 1
fi

python3 ec2/gestionar_ec2.py $accion $instancia

if [ -z "$accion" ] || [ -z "$instancia" ] || [ -z "$carpeta" ] || [ -z "$bucket" ]; then
    echo "Uso: ./deploy.sh accion instance_id directorio bucket"
    exit 1
fi

bash s3/backup_s3.sh $carpeta $bucket
