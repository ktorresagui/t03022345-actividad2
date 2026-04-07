# Actividad 2: DevOps
## Karol Stephania Torres Aguilar

## Descripción del proyecto

Este proyecto implementa una solución de automatización en AWS con enfoque DevOps. Permite gestionar instancias EC2 mediante Python utilizando la librería Boto3, realizar respaldos de información en Amazon S3 mediante scripts en Bash y simular un flujo de integración y despliegue continuo (CI/CD) a través de un script de orquestación.

Además, se aplican buenas prácticas como el uso de control de versiones con Git y GitHub, la separación entre configuración y lógica, y la automatización de tareas operativas.

El proyecto se ejecuta desde una instancia EC2 dentro del entorno AWS Learner Lab.

---

## Instrucciones de uso

1. Cargar las variables de configuración:

    source config/config.env

2. Ejecutar el script principal de despliegue:

    ./deploy.sh <accion> <instance_id> <directorio> <bucket>

3. Ejemplo de ejecución:

    ./deploy.sh iniciar i-123456 ./data mi-bucket-devops

Este comando ejecuta la acción sobre la instancia EC2 y realiza el respaldo del directorio hacia el bucket S3.

---

## Flujo Git

Se utilizó una estrategia de ramas basada en buenas prácticas:

- main: versión estable  
- develop: integración  
- feature/*: desarrollo de funcionalidades  

### Flujo de trabajo

1. Crear rama feature desde develop  
2. Desarrollar la funcionalidad  
3. Realizar commits progresivos  
4. Hacer push al repositorio  
5. Merge a develop  
6. Merge a main  

---

## Ejemplos

### Gestión de EC2

    python3 ec2/gestionar_ec2.py listar
    python3 ec2/gestionar_ec2.py iniciar i-123456

### Respaldo en S3

    bash s3/backup_s3.sh ./data mi-bucket-devops

### Ejecución completa

    ./deploy.sh iniciar i-123456 ./data mi-bucket-devops
