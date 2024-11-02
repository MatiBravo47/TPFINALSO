<H1 align="center">Trabajo practico final sistema operativo</H1>

<p align="center">
  <img src=https://github.com/user-attachments/assets/34cad956-c89c-4e89-9f2e-1897b70b6fab alt="Logo IDRA">
</p>

## Descripcion proyecto 
Trabajo practico donde se busca aplicar e integrar los conceptos vistos a lo largo de la cursada. 
Se desarrollo un script en bash que automatiza 3 tareas aplicando comandos unix. 

## Instrucciones de uso y ejemplos
### Ejecucion del programa 
Para ejecutar el siguiente programa es necesario tener instalado sistema operativo linux, localmente, con máquina virtual o instalando wsl ubuntu para windows esto lo que hace es instalar la terminal de ubuntu o el sistema de ubuntu en su sistema operativo Windows.
Pasos para ejecutar el programa usando wls

1. Abrimos la terminal de linux 
2. Clonar el repositorio de github `git clone https://github.com/MatiBravo47/TPFINALSO.git`
3. Entramos en la carpeta de la carpeta clonada con `cd TPFINALSO`
4. Agregamos permisos de ejecucion `chmod +x TPFINAL.sh`
5. Por último, ejecutamos el archivo escribiendo `sudo ./TPSO.sh`
  
## Instrucciones para colaborar 

Para crear instrucciones claras de colaboración en un repositorio de GitHub, puedes incluir una sección en el archivo README.md o crear un archivo separado llamado CONTRIBUTING.md. Este archivo debe explicar los pasos básicos que los colaboradores deben seguir. A continuación te doy una guía paso a paso:
Instrucciones para colaborar en un repositorio de GitHub
Clona el repositorio:
Primero, haz un fork del repositorio en tu cuenta de GitHub.
Luego, clona el fork a tu máquina local con el siguiente comando en la terminal:
bash
Copiar código
git clone https://github.com/tu-usuario/tu-repositorio.git


Configura el repositorio original como remoto:
Esto permite sincronizar tu fork con el repositorio original. Entra al directorio clonado:
bash
Copiar código
cd tu-repositorio


Luego, agrega el repositorio original como "upstream":
bash
Copiar código
git remote add upstream https://github.com/usuario-original/repositorio-original.git


Crea una rama para tu contribución:
Asegúrate de crear una rama nueva para cada funcionalidad o cambio que quieras proponer.
bash
Copiar código
git checkout -b nombre-de-tu-rama


Haz cambios y commits:
Realiza los cambios necesarios en el código.
Usa mensajes de commit descriptivos que expliquen el propósito de cada cambio.
bash
Copiar código
git add .
git commit -m "Descripción breve de los cambios"


Sincroniza con el repositorio original (opcional, pero recomendado):
Antes de enviar tu cambio, asegúrate de que tu fork esté actualizado con el repositorio original:
bash
Copiar código
git fetch upstream
git merge upstream/main


Sube tu rama a GitHub:
Sube la rama en la que has trabajado a tu fork en GitHub.
bash
Copiar código
git push origin nombre-de-tu-rama


Crea un Pull Request:
Ve a tu repositorio en GitHub, selecciona la rama en la que trabajaste y haz clic en New Pull Request.
Especifica el objetivo del Pull Request, qué problema soluciona o qué mejora.
Asegúrate de seguir las instrucciones específicas del repositorio, si las hay, sobre cómo redactar el PR.
Responde a la retroalimentación:
Es posible que el equipo de mantenimiento del repositorio revise tu código y deje comentarios o sugiera cambios.
Asegúrate de responder y hacer los ajustes necesarios.
Ejemplo de estructura para el archivo CONTRIBUTING.md:
markdown
Copiar código
# Guía para Colaborar

Gracias por tu interés en contribuir a este proyecto. Por favor, sigue los pasos indicados a continuación para realizar tu contribución.

## Pasos para colaborar

1. Haz un fork de este repositorio y clónalo a tu máquina.
2. Crea una nueva rama para tu cambio: `git checkout -b nombre-de-tu-rama`.
3. Realiza tus cambios y añade un mensaje de commit claro.
4. Sincroniza tu fork con el repositorio original si es necesario.
5. Sube tu rama: `git push origin nombre-de-tu-rama`.
6. Abre un Pull Request explicando tus cambios.

¡Gracias por tu contribución!

Estas instrucciones te ayudarán a guiar a los colaboradores para que contribuyan de manera eficiente y organizada en tu proyecto de GitHub.


## Indicar bajo que licencia se distribuye el proyecto 

