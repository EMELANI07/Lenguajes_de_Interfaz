// =====================================
// Autor: Estrada Rodriguez Melani
// Materia: Lenguajes de Interfaz 
// Grupo: SC6C
// Fecha: 12/Febrero/26
// Arquitectura: ARM64 (AArch64)
// Descripción: Código con los programas Termux y tailscare, 
// código con nano, compile manualmente y ejecute un programa funcional en Linux ARM64.
// =====================================

// -------------------------------------
// Solución en alto nivel (Pseudocódigo)
// 1. Instalar e iniciar Termux
// 2. Instalar paquete openssh
// 3. Crear una contraseña
// 4. Iniciar servicio sshd
// 5. Obtener dirección IP del celular
// 6. Ir a la computadora con Windows
// 7. Instalar cliente OpenSSH si no está instalado
// 8. Ejecutar comando:
//      ssh -p 8022 usuario@IP (Para la conexión)
// 9. Ingresar la contraseña creada
// 10. Si autenticación es correcta:
//        Permitir ejecución remota de comandos y instalar asciinema para la grabación
//     Si no:
//        Mostrar error de autenticación
// 11. Finalizar conexión con comando "exit" y finalizar asciinema
// 12. Programa completado
// -------------------------------------

// Código Ensamblador Comentado//

.section .text
.global _start

_start:                               // Indica que se inicia y el control se manda aqui 
                                      // (En el caso de la practica el control se manda a la computadora).
    // Se inician los registros
    mov x0, #0          // Registro x0 usado para código de salida (status = 0, exito!)

    // Lógica principal del programa
    // Se compila la parte principal del codigo
    // Pero no se realiza nada en especial solo se prepara para finalizar.

    // Finalizar el programa
    mov x8, #93         // syscall: exit (x8 el número de la syscall)
                        // 93 corresponde a exit en Linux ARM64
    svc #0
                       // Se llamada al sistema
                       // El kernel termina el programa

//------------------------------------------------------------------------------------------------------------------------------------------------------------
// 🪡 Instrucciones de Compilación y Ejecución**

as programa.s -o programa.o //Ensambla el archivo fuerte
                            // as = ensamblador, programa.s = archivo con código en ensamblador., 
                            // -o programa.o = Genera un archivo objeto llamado programa.o
ld programa.o -o programa   //Enlaza el archivo objeto
                            // ld = es el enlazador, programa.o = Archivo objeto generado, -o programa = Crea el ejecutable final llamado programa.
./programa                  // ./ = indica que el programa está en el directorio actual, programa = es el ejecutable que se genero anteriormente.

//------------------------------------------------------------------------------------------------------------------------------------------------------------
// Evidencia de Ejecución / Depuración (Asciinema)
// 🎥 Asciinema: https://asciinema.org/a/1SNXHWDo0BP9RdMP
//--------------------------------------------------------------------
// 🧩 Resultados Esperados

// Que aprendamos como unir dos diferentes tipos de tecnologias a travez de sshd, como si fuera en un servidor, siendo el client la computadora
// para que pueda ser controlado el celular a travez de la computadora, asi como aprender sobre las IPs y su uso en las conexiones.
// Asi como aprender sobre que aplicaciones se necesitan como Termux y Tailscare.
//------------------------------------------------------------------------------------------------------------------------------------------------
// 💻 Conclusión

// Para finalizar al trabajar este programa en ensamblador ARM64, se aprendio una estructura de un programa en Linux, asi 
// como poder conectar el celular y la computadora, logrando controlar el celular desde la computadora, tambien 
// Utilizar registros del procesador (como x0 y x8) o hacer los enlaces de los programas con as y ld.
// Asi como corregir algunos errores que fueron saliendo a lo largo de la practica, como instalar el Client en la computadora
// Para que pueda funcionar correctamente. 
//-----------------------------------------------------------------------------------------------------------------------------------
// Observaciones (Opcional)

// Como mencione anteriormente, algunos errores que ocurrieron fueron al intalar el Client, pero al hacerlo se pudieron enlazar,
// otro pequeño tropiezo fue al intentar saber donde poner el comando de la IP (ssh -p 8022 usuario@IP), ya que no sabia donde debia 
// de compilarlo hasta que me ayudaron unos amigos y encontre el Powershell.
