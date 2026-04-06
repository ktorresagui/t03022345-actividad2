import boto3
import sys

ec2 = boto3.client('ec2')

def ejecutar(accion, instance_id=None):
   if accion == "listar":
       data = ec2.describe_instances()
       for r in data["Reservations"]:
           for i in r["Instances"]:
               print(i["InstanceId"], i["State"]["Name"])
