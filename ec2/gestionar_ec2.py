import boto3
import sys

ec2 = boto3.client('ec2')

def ejecutar(accion, instance_id=None):
    if accion == "listar":
        data = ec2.describe_instances()
        for r in data["Reservations"]:
            for i in r["Instances"]:
                print(i["InstanceId"], i["State"]["Name"])

    elif accion == "iniciar":
        ec2.start_instances(InstanceIds=[instance_id])
        print("Instancia iniciada")

    elif accion == "detener":
        ec2.stop_instances(InstanceIds=[instance_id])
        print("Instancia detenida")

    elif accion == "terminar":
        ec2.terminate_instances(InstanceIds=[instance_id])
        print("Instancia eliminada")

    else:
        print("Comando inválido")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Faltan parámetros")
    else:
        accion = sys.argv[1]
        instance_id = sys.argv[2] if len(sys.argv) > 2 else None
        ejecutar(accion, instance_id)
