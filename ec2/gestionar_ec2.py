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
 
    elif accion == "detener":
        if not instance_id:
            print("Falta instance_id")
            return
        try:
            ec2.stop_instances(InstanceIds=[instance_id])
            print("Instancia detenida")
        except Exception as e:
            print(f"Error al detener instancia: {e}")
 
    elif accion == "terminar":
        if not instance_id:
            print("Falta instance_id")
            return
        try:
            ec2.terminate_instances(InstanceIds=[instance_id])
            print("Instancia eliminada")
        except Exception as e:
            print(f"Error al terminar instancia: {e}")
 
    else:
        print("Comando inválido")
 
 
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Faltan parámetros")
    else:
        accion = sys.argv[1]
        instance_id = sys.argv[2] if len(sys.argv) > 2 else None
        ejecutar(accion, instance_id)
 
