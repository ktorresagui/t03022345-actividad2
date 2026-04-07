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

---

# Reflexión

## ¿Qué ventaja tienen los commits progresivos?

Los commits progresivos permiten dividir el desarrollo en cambios pequeños, claros y controlados. Esto facilita el seguimiento del historial del proyecto y permite identificar con mayor facilidad en qué momento se introdujo un error.

Además, ayudan a mantener un desarrollo ordenado, mejoran la colaboración en equipo y permiten revertir cambios específicos sin afectar todo el sistema. En entornos DevOps, esta práctica es clave para mantener la estabilidad del sistema y facilitar la integración continua.

---

## ¿Por qué evitar hardcoding?

Evitar el hardcoding permite que el sistema sea más flexible, reutilizable y fácil de mantener. Cuando los valores están definidos directamente en el código, cualquier cambio requiere modificar la lógica del programa, lo cual aumenta el riesgo de errores.

Al utilizar parámetros o archivos de configuración, es posible adaptar el sistema a distintos entornos sin modificar el código, lo cual es fundamental en procesos de automatización y despliegue continuo.

---

## ¿Qué rol cumple deploy.sh?

El script deploy.sh cumple la función de orquestador dentro del sistema. Se encarga de coordinar la ejecución de los scripts de gestión de EC2 y respaldo en S3, integrando todas las tareas en un solo flujo automatizado.

Además, simula un pipeline de CI/CD, permitiendo ejecutar múltiples procesos con un solo comando. Esto reduce la intervención manual, mejora la eficiencia operativa y minimiza errores.

---

## ¿Qué ventaja tiene separar config del código?

Separar la configuración del código permite modificar valores sin necesidad de alterar la lógica del programa. Esto mejora la mantenibilidad, reduce riesgos y facilita la reutilización del código en diferentes escenarios.

También permite manejar distintos entornos de ejecución simplemente cambiando el archivo de configuración, lo cual es una práctica esencial en DevOps para lograr sistemas más flexibles y escalables.
