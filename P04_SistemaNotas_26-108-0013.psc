Proceso EjercicioFinal
	Definir i, opcion, estudiante, extra, nota Como Entero
	Definir promedio, mayor Como Real
	Definir aprobados Como Entero
	Definir categoria Como Caracter
	
	Dimension notas[5]
	
	Para i <- 1 Hasta 5 Hacer
		notas[i] <- 0
	FinPara
	
	Repetir
		
		Escribir "   SISTEMA DE NOTAS FE729"
		Escribir "1. INGRESAR NOTA"
		Escribir "2. MOSTRAR NOTAS Y CATEGORIAS"
		Escribir "3. ESTADISTICAS"
		Escribir "4. SUMAR PUNTOS EXTRA"
		Escribir "5. SALIR"
		Escribir "Seleccione una opcion:"
		Leer opcion
		
		Segun opcion Hacer
			
			1:
				Para i <- 1 Hasta 5 Hacer
					Repetir
						Escribir "Ingrese la nota del estudiante ", i, ":"
						Leer nota
						
						Si nota < 0 O nota > 100 Entonces
							Escribir "Nota Invalida"
						FinSi
						
					Hasta Que nota >= 0 Y nota <= 100
					
					notas[i] <- nota
				FinPara
				
			2:
				Para i <- 1 Hasta 5 Hacer
					categoria <- ObtenerCategoria(notas[i])
					Escribir "Estudiante ", i, ": ", notas[i], " - ", categoria
				FinPara
				
			3:
				promedio <- CalcularPromedio(notas, 5)
				mayor <- CalcularNotaMayor(notas, 5)
				aprobados <- ContarAprobados(notas, 5)
				
				Escribir "Promedio: ", promedio
				Escribir "Nota mas alta: ", mayor
				Escribir "Estudiantes aprobados: ", aprobados
				
			4:
				Escribir "Ingrese el numero del estudiante (1-5):"
				Leer estudiante
				
				Si estudiante >= 1 Y estudiante <= 5 Entonces
					Escribir "Ingrese los puntos extra:"
					Leer extra
					
					Si extra >= 0 Entonces
						Si notas[estudiante] + extra > 100 Entonces
							notas[estudiante] <- 100
						SiNo
							notas[estudiante] <- notas[estudiante] + extra
						FinSi
						
						Escribir "Nueva nota: ", notas[estudiante]
					SiNo
						Escribir "Los puntos extra no pueden ser negativos."
					FinSi
					
				SiNo
					Escribir "Estudiante invalido."
				FinSi
				
			5:
				Escribir "Saliendo del programa..."
				
			De Otro Modo:
				Escribir "Opcion invalida."
				
		FinSegun
		
	Hasta Que opcion = 5
FinAlgoritmo

	Funcion categoria <- ObtenerCategoria(nota)
		Si nota >= 0 Y nota <= 60 Entonces
			categoria <- "Insuficiente"
		SiNo
			Si nota >= 61 Y nota <= 75 Entonces
				categoria <- "Satisfactorio"
			SiNo
				Si nota >= 76 Y nota <= 89 Entonces
					categoria <- "Notable"
				SiNo
					categoria <- "Sobresaliente"
				FinSi
			FinSi
		FinSi
FinFuncion


Funcion promedio <- CalcularPromedio(notas, cantidad)
	Definir i, suma Como Entero
	
	suma <- 0
	
	Para i <- 1 Hasta cantidad Hacer
		suma <- suma + notas[i]
	FinPara
	
	promedio <- suma / cantidad
FinFuncion


Funcion mayor <- CalcularNotaMayor(notas, cantidad)
	Definir i Como Entero
	
	mayor <- notas[1]
	
	Para i <- 2 Hasta cantidad Hacer
		Si notas[i] > mayor Entonces
			mayor <- notas[i]
		FinSi
	FinPara
FinFuncion


Funcion aprobados <- ContarAprobados(notas, cantidad)
	Definir i Como Entero
	
	aprobados <- 0
	
	Para i <- 1 Hasta cantidad Hacer
		Si notas[i] >= 61 Entonces
			aprobados <- aprobados + 1
		FinSi
	FinPara
FinFuncion

