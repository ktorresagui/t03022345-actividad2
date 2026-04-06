import boto3
import sys

ec2 = boto3.client('ec2')

def ejecutar(accion, instance_id=None):

    if accion == "listar":
        try:
            data = ec2.describe_instances()
            for r in data["Reservations"]:
                for i in r["Instances"]:
                    print(i["InstanceId"], i["State"]["Name"])
        except Exception as e:
            print(f"Error al listar instancias: {e}")

    elif accion == "iniciar":
        if not instance_id:
            print("Falta instance_id")
            return
        try:
            ec2.start_instances(InstanceIds=[instance_id])
            print("Instancia iniciada")
        except Exception as e:
            print(f"Error al iniciar instancia: {e}")
