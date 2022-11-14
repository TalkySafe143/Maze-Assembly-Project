		#################################################################
		#	       	 Programa hecho por: Sebastian Galindo		#
		#		 		     Miguel Rico		#
		#################################################################
.data
	bitmap: .word 0x10008000 # Esta es la direccion del bitmap
	keyboard: .word 0xffff0004 # Direccion donde se captura el Keyboard (ASCII code)
	message: .asciiz "Recierda que te puedes rendir con la letra r"
	
	# Sistema de layouts de las pantallas
	# Cada pantalla y laberinto contiene un arreglo de 32*32 elementos con 1's y 0's
	# Donde los 1's son las paredes o el relleno y los 0's son los espacios o corredores

	laberinto: .word 1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,
			 1,1,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,1,
			 1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,1,1,
			 1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,
			 1,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,1,1,
			 1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,
			 1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,
			 1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,
			 1,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,1,
			 1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,0,1,1,
			 1,0,0,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,
			 1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,
			 1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,
			 1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,
			 1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,1,
			 1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,
			 1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,1,
			 1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,0,1,1,
			 1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1,1,
			 1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,
			 1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,1,
			 1,0,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,
			 1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1,1,
			 1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,
			 1,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,1,1,
			 1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,
			 1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,
			 1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,
			 1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
			
	laberintoTwo: .word 1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			    1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,1,
			    1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,
			    1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,
			    1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1,1,
			    1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,0,0,1,1,
			    1,0,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,
			    1,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,
			    1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,1,
			    1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,
			    1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,
			    1,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,1,
			    1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,
			    1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,1,
			    1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,
			    1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
			    1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0,1,1,
			    1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,1,1,
			    1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,1,
			    1,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,1,
			    1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,
			    1,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1,1,
			    1,0,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0,1,1,
			    1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,1,0,1,0,1,1,
			    1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,1,
			    1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,1,
			    1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,
			    1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,1,
			    1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,
			    1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
			    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
			 
	failScreen: .word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,1,1,0,1,1,1,1,
			  1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,1,1,1,
			  1,1,1,0,0,0,0,0,1,0,1,1,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,0,1,1,1,0,1,0,0,1,1,0,0,1,1,1,1,0,1,1,1,1,1,1,
			  1,1,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
			  
	winScreen: .word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,0,1,1,1,0,1,0,0,0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,0,0,0,0,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,1,1,0,1,0,1,0,0,0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
			 1,1,1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	
	menuScreen: .word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1,1,
			  1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,
			  1,1,1,0,1,1,1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,1,1,1,1,
			  1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,
			  1,1,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,1,1,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,1,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,0,0,0,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
			  
	surrenderScreen: .word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,0,1,0,1,0,1,0,0,1,1,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,0,0,0,1,0,1,0,0,1,1,1,0,0,0,1,0,0,0,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,0,1,1,1,0,1,0,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,0,1,0,0,0,1,0,0,0,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,0,1,1,1,0,0,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,0,1,0,0,0,1,0,0,1,1,1,0,0,0,1,0,1,0,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
.text
	main:
		# Lista de registros:
		# $t0 -> Contiene la direccion de memoria del bitmap screen
		# $t1 -> Contiene el color de las paredes/relleno
		# $t2 -> Contiene el registro si ya se detecto una letra en el Keyboard
		# $t3 -> Contiene la letra registrada en el KeyBoard
		# $t4 -> Contiene el numero de pixeles a rellenar
		# $t6 -> Contiene la referencia a la posicion del arreglo de las pantallas
		# $t7 -> Contiene la referencia de la ultima posicion del arreglo de las pantallas
		# $t9 -> Contiene el color del jugador
		# $a0 -> Contiene la info de las syscalls y va a obtener si en la posicion del
		# arreglo deseado es un 1 o un 0 (Contiene los numeros leidos del arreglo)
		# $a3 -> Este registro tiene dos utilidades en dos partes del programa
		# 		- En una primera parte se utiliza para guardar los registros de las letras 
		#		- En una segunda parte se utiliza como referencia para la meta
		#		- Tambien contiene un codigo para saber si se tiene que salir
		# $s0 -> Este registro contiene el arreglo de cada pantalla que se quiera cargar
		# $s1 -> Este registro contiene el codigo del color del espacio
		
		#################################################################
		#	       	 Primeras configuraciones			#
		#################################################################
		
		# Se imprime el String para avisar que se puede rendir en cualquier momento
		li $v0, 4
		la $a0, message
		syscall
		
		li $t6, 0 # Primera posicion del canvas del bitmap por rellenar
		li $t7, 1024 # Ultima posicion del canvas del bitmap por rellenar
		lw $t0, bitmap # Vamos a cargar la dirección del canvas del bitmap
		li $t4, 1024 #Contador de pixeles 256/8*256/8
		la $s0, menuScreen # Vamos a cargar el arreglo de la primera pantalla "Choose 1 o 2"
		li $a3, 0 # Vamos a cargar el codigo 0 a $a3 para indicar que vamos a jugar
		li $t1, 0x00ff64 # Estos son los codigos de los colores: 0xRRGGBB (Paredes)
		li $s1, 0xffffff # Estos son los codigos de los colores: 0xRRGGBB (Espacios)
		
	setup:
		#################################################################
		#			Incio del Loop				#
		#################################################################
		
		beq $t6, $t7, choose # Se mira si ya llego al final del arreglo
		
		lw $a0, ($s0) # Se carga el elemento que este en la posicion del arreglo a $a0
		
		beq $a0, 1, drawWallColor # Si es 1, vamos a dibujar una pared
		beq $a0, 0, drawSpaceColor # Si es un 0, vamos a dibujar un espacio
		
		j setup # En cualquiera de los casos inesperados, vuelve a arriba
	
	choose:
		#################################################################
		#	Elegir camino cuando se termina de recorrer		#
		#################################################################
		
		la $s0, laberinto # Se carga el laberinto 1 por defecto
		beq $a3, 49, setupPlayer # Si la tecla anterior es '1', salta a comenzar el juego
		la $s0, laberintoTwo # Si no se elegió el laberinto 1, entonces se carga el 2
		beq $a3, 50, setupPlayer # Si la tecla anterior es '2', salta a comenzar el juego
		beq $a3, 1, terminate # Si $a3 contiene el codigo 1 - terminó el juego
		beq $a3, 2, terminate # Si $a3 contiene el codigo 2 - terminó el juego
		
		lw $t8, keyboard # Se carga en $t8 la direccion del teclado
		lw $t2, 0xffff0000 # Este registro contiene 0 si no se ha escrito nada, 1 si ya
		
		#################################################################
		#		   Elegir el mapa a jugar			#
		#################################################################
		
		beq $t2, 0, choose # Si no se ha registrado ninguna tecla, inicia de nuevo 'choose:'
		
		li $t6, 0 # Reiniciamos la contador de la posicion del arreglo
		lw $t0, bitmap # Volvemos a cargar el bitmap para reiniciar la posicion
		
		lw $a3, ($t8) # Se carga la tecla que se oprimió en el teclado
		
		la $s0, laberinto # Se carga el laberinto 1 por defecto
		beq $a3, 49, setup # Si la tecla es 1 - pinta el primer laberinto, este vuelve al
		# Principio y se queda registrado el 49 en $a3
		la $s0, laberintoTwo # Si no se elegió el primer laberinto, se carga el segundo
		li $t1, 0xECB430 # Se carga un nuevo color para las paredes
		beq $a3, 50, setup # Si la tecla es 2 - pinta el segundo laberinto
		j terminate # En cualquiera de los casos inesperados, termina el programa
	
	drawWallColor:
	
		#################################################################
		#		   Dibujar pared de la pantalla			#
		#################################################################
		
		sw $t1, ($t0) # Se carga el color a el pixel del bitmap correspondiente
		addi $t4, $t4, -1 # Se resta en 1 la cantidad de pixeles a pintar
		addi $t0, $t0, 4 # Se suman 4 bits para seguir al siguiente pixel del bitmap
		
		addi $t6, $t6, 1 # Se suma en uno la posicion del arreglo
		addi $s0, $s0, 4 # Se suma en 4 el arreglo para seguir a la siguiente posicion del
		# Arreglo
		j setup # Vuelve a verificar si hay que terminar o dibujar algo
		
	drawSpaceColor:
	
		#################################################################
		#		   Dibujar pared de la pantalla			#
		#################################################################
		
		sw $s1, ($t0) # Se carga el color a el pixel del bitmap correspondiente
		addi $t4, $t4, -1 # Se resta en 1 la cantidad de pixeles a pintar
		addi $t0, $t0, 4 # Se suman 4 bits para seguir al siguiente pixel del bitmap
		
		addi $t6, $t6, 1 # Se suma en uno la posicion del arreglo
		addi $s0, $s0, 4 # Se suma en 4 el arreglo para seguir a la siguiente posicion del
		# Arreglo
		j setup # Vuelve a verificar si hay que terminar o dibujar algo
	
	setupPlayer:
	
		#################################################################
		#		   Configurar inicio del juego			#
		#################################################################
	
		addi $s0, $s0, 4 # Vamos a colocarnos en la segunda posicion de los laberintos
		# Los dos laberintos empiezan por la posicion 2.
		lw $t0, bitmap # Vamos a cargar de nuevo el bitmap para reiniciar el canvas
		addi $t0, $t0, 4 # Y nos vamos a colocar de igual manera en el segundo pixel
		li $t9, 0x0e79b1 # Cargamos el color del jugador
		sw $t9, ($t0) # Lo pintamos en el segundo pixel del bitmap (Comienzo)
		
		li $t1, 0xff0000 # Vamos a cargar el color rojo
		lw $t0, bitmap # Y vamos a reiniciar el canva del bitmap, solo por conveniencia
		addi $t0, $t0, 3836 # Vamos a llegar a la coordenada de la meta
		sw $t1, ($t0) # Y lo vamos a pintar de color rojo
		li $a3, 3836 # $a3 ahora va a tener la referencia de la coordenada de la meta
		
		li $t1, 0xffffff # Volvemos a reestablecer el color del espacio
		lw $t0, bitmap # Vamos a reiniciar el canvas del bitmap
		addi $t0, $t0, 4 # Y vamos a posicionarnos en el comienzo para comenzar
		li $t9, 0x0e79b1 # Vamos a cargar el color del juegador
		sw $t9, ($t0) # Y lo ingresamos en el segundo pixel de nuevo para comenzar
		
	movePlayer:
	
		#################################################################
		#		   Loop para mover el jugador			#
		#################################################################
	
		lw $t8, keyboard # Cargamos la direccion del keyboard de nuevo
		lw $t2, 0xffff0000 # Este registro contiene 0 si no se ha escrito nada, 1 si ya
		
		beq $t2, 0, movePlayer # Si todavía no se ha escrito nada, vuelve al principio del loop
		
		
		lw $t3, ($t8) # Si ya se escribió algo, se va a cargar en $t3
		
		beq $t3, 97, moveLeft # a
		beq $t3, 119, moveBackwards # w
		beq $t3, 115, moveForwards # s
		beq $t3, 100, moveRight # d
		beq $t3, 114, quit # r
		j movePlayer # En cualquiera de las otras letras inesperadas, vuelve al principio del loop
	
	moveLeft:
		
		#################################################################
		#		Mover el jugador a la izquierda			#
		#################################################################
	
		sw $t1, ($t0) # Vamos a pintar el blanco el pixel donde estaba
		addi $t0, $t0, -4 # Como nos vamos a mover a la izquierda, restamos 4
		sw $t9, ($t0) # Y en la posicion en el bitmap que quede, lo pintamos de jugador
		addi $s0, $s0, -4 # Se va a restar una posicion en el arreglo del laberinto
		lw $a0, ($s0) # Y vamos a capturar el valor que tiene el arreglo en esa posicion
		addi $a3, $a3, 4 # La referencia de la meta tiene que ir en sentido contrario
		# Para encontrarse con el comienzo, se sabe que se ganó el juego cuando despues
		# De mover la referencia al sentido contrario al jugador, quedá en la posicion
		# De inicio del juego, es decir, cuando es igual a 4.
		
		beq $a0, 1, fail # Si el valor del arreglo es 1 (Una pared) quiere decir que perdió
		beq $a3, 4, win # Si el valor de la referencia es 4, quiere decir que ganó
		j movePlayer # Si sigue vivo y en el juego, vuelve al loop de mover el jugador
		
	moveForwards:
	
		#################################################################
		#		Mover el jugador a adelante			#
		#################################################################
	
		sw $t1, ($t0) # Pintamos de blanco el pixel en el que estaba
		addi $t0, $t0, 128 # Como necesitamos recorrer toda una fila hasta llegar a la
		# Posicion de adelante del pixel, entonces 32*4 = 128
		# Donde 32 son los pixeles o los cuadros de una fila
		# Y 4 son los bits que se tienen que sumar al arreglo para cambiar de posicion
		# Es decir, nos estamos moviendo 32 posiciones en el bitmap
		sw $t9, ($t0) # Cargamos el color del jugador en la posicion que cayó
		addi $s0, $s0, 128 # Hacemos el mismo proceso con el arreglo de referencia del laberinto
		lw $a0, ($s0) # Cargamos el valor que contiene el arreglo
		addi $a3, $a3, -128 # Y la referencia de la meta la movemos al sentido contrario
		
		beq $a0, 1, fail # Si el valor del arreglo es 1, entonces perdió (Toco una pared)
		beq $a3, 4, win # Si la referencia de la meta es 4, quiere decir que ganó
		j movePlayer # Si sigue con vida, vuelve al loop para mover al jugador
	
	moveBackwards:
		
		#################################################################
		#		Mover el jugador hacia atras			#
		#################################################################
		
		sw $t1, ($t0) # Vamos a pintar de blanco el pixel dond estaba el jugador
		addi $t0, $t0, -128 # Y vamos a restar 32 pixeles al bitmap para caer en la fila anterior
		sw $t9, ($t0) # Cargamos el color del jugador en el pixel donde cayó
		addi $s0, $s0, -128 # De igual manera, corremos el arreglo de referencia del laberinto
		lw $a0, ($s0) # Y obtenemos el valor del arreglo
		addi $a3, $a3, 128 # Movemos la referencia de la meta al sentido contrario
		
		
		beq $a3, 3964, fail # Si es el primer movimiento y se mueve para arriba (Vacío)
		# Puede seguir la ejecucion, eso no es lo ideal, por lo tanto, si la referencia de
		# La meta en algún momento es la posicion abajo de la meta (Porque la meta se mueve
		# en sentido contrario) quiere decir que en el primer movimiento se salió del mapa
		# Por lo que tiene que perder.
		beq $a0, 1, fail # Si el valor del arreglo es 1, quiere decir que perdió (Tocó pared)
		beq $a3, 4, win # Si la referencia de la meta es 4, quiere decir que ganó
		j movePlayer # Si sigue con vida, vuelve al loop de mover jugador
	
	moveRight:
	
		#################################################################
		#		Mover el jugador a la derecha			#
		#################################################################
							
		sw $t1, ($t0) # Cargamos el color blanco en el pixel donde estaba.
		addi $t0, $t0, 4 # Aumentamos un pixel en el canvas del bitmap
		sw $t9, ($t0) # Pintamos el color del jugador donde cayó
		addi $s0, $s0, 4 # Aumentamos una posicion en el arreglo del laberinto
		lw $a0, ($s0) # Cargamos el valor de la posicion del arreglo
		addi $a3, $a3, -4 # Y movemos la referencia de la meta al sentido contrario
		
		beq $a0, 1, fail # Si el valor del arreglo es 1, perdió (Toco pared)
		beq $a3, 4, win # Si la referencia de la meta es 4, quiere decir que ganó
		j movePlayer # Si sigue con vida el jugador, vuelve al loop para mover el jugador
	win:
		#################################################################
		#		   El jugador ganó el juego			#
		#################################################################
		
		li $s1, 0x00ff64 # Vamos a cargar el color verde en el espacio para escribir los pixeles
		lw $t0, bitmap # Reiniciamos la dirección del canvas del bitmap para pintarlo de nuevo
		li $t6, 0 # Reinciamos el contador de pixeles por pintar para llenar la pantalla
		la $s0, winScreen # Cargamos el arreglo de referencia de la pantalla de win
		li $a3, 2 # Y en $a3 cargamos el codigo 2, que va a servir de referencia cuando
		# Se termine de pintar el canvas, para indicar que se ganó el juego
		j setup # Salta a pintar el canvas del bitmap
		
	fail:
		
		#################################################################
		#		   El jugador perdió el juego			#
		#################################################################
		
		lw $t0, bitmap # Se reincia la direccion del canvas para pintarlo
		li $t6, 0 # Se reincia el contador de pixeles a pintar
		la $s0, failScreen # Se carga el arreglo de referencia de la pantalla de "sorry"
		li $t1, 0xff0000 # Se carga el color rojo como color de pared
		li $a3, 1 # Y cargamos en $a3 el codigo 1 para indicar que perdimos
		j setup # Salta a pintar el canvas del bitmap

	quit:
		
		#################################################################
		#		 El jugador se rindió del juego			#
		#################################################################
		
		lw $t0, bitmap # Se reincia la direccion del canvas del bitmap
		li $t6, 0 # Se reincia el contador de pixeles por pintar
		la $s0, surrenderScreen # Se carga el arreglo de referencia para la pantalla "Surrender"
		li $t1, 0xff0000 # Se carga el color rojo como color de pared
		li $a3, 1 # Y se carga en $a3 el codigo 1 para indicar que perdió
		j setup # Salta a pintar el canvas del bitmap
		
	terminate:

		#################################################################
		#		     Finalizar la ejecución			#
		#################################################################
	
		# Se hace el syscall para terminar la ejecución del programa
		li $v0, 10
		syscall
