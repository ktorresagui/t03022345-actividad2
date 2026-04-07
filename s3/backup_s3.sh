#!/bin/bash

DIR=$1
BUCKET=$2
NOW=$(date +"%Y-%m-%d_%H-%M-%S")
FILE="respaldo_$NOW.tar.gz"
LOGFILE="logs/s3.log"
