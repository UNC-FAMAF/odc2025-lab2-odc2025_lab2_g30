        .equ SCREEN_WIDTH,640
        .equ SCREEN_HEIGH,480
        .equ BITS_PER_PIXEL,32

        .extern rectangulo	// llama a la funcion rectangulo que esta definida en un archivo externo llamado funciones. 
        .extern circulo		// lo mismo hace con esta funcion que define los circulos.

        .globl main		// la directiva .globl en el main sirve para que se ejecute el programa.
        .globl rectangulo 	// aqui sirve para que las funciones rectangulo y circulo puedan ser llamadas dentro del archivo app.s, siendo que estan definidas en un archivo diferente.
        .globl circulo


main:
        // x0 contiene la direccion base del framebuffer
        mov x20, x0// Guarda la dirección base del framebuffer en x20

        //---------------- CODE HERE ------------------------------------

        movz x11, 0xFF00, lsl 16 
        movk x11, 0x0000, lsl 00 // x11 contiene el color negro del fondo

        mov x2, SCREEN_HEIGH// Y Size

loop1:

        mov x1, SCREEN_WIDTH// X Size

loop0:

        stur w11,[x0]	// Colorear el pixel
        add x0,x0,4	// Siguiente pixel
        sub x1,x1,1	// Decrementar contador X
        cbnz x1,loop0	// Si no terminó la fila, salto
        sub x2,x2,1	// Decrementar contador Y
        cbnz x2,loop1	// Si no es la última fila, salto


//----------TIERRA

        movz w7, 0x433F, lsl 16		// primera mitad del color.
	movk w7, 0x7AFF, lsl 00		// completa el color.
    	mov x11, 320			// centro coordenada x.
    	mov x12, 480			// centro coordenada y.
    	mov x13, 230			// radio del circulo.
	bl circulo			// funcion llamada.

//----------CONTINENTES

        mov x29, 210			// punto de partida de x.
        mov x21, 310			// punto de partida de y.
        mov x28, 50			// ancho del rectangulo.
        mov x27, 80			// alto del rectangulo.
        movz x26, 0xFF00		// primera mitad del color.
        movk x26, 0x633D, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 260			// punto de partida de x.
        mov x21, 315			// punto de partida de y.
        mov x28, 40			// ancho del rectangulo.
        mov x27, 40			// alto del rectangulo.
        movz x26, 0xFF00		// primera mitad del color.
        movk x26, 0x633D, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 190			// punto de partida de x.
        mov x21, 315			// punto de partida de y.
        mov x28, 20			// ancho del rectangulo.
        mov x27, 30			// alto del rectangulo.
        movz x26, 0xFF00		// primera mitad del color.
        movk x26, 0x633D, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 350			// punto de partida de x.
        mov x21, 320			// punto de partida de y.
        mov x28, 120			// ancho del rectangulo.
        mov x27, 50			// alto del rectangulo.
        movz x26, 0xFF00		// primera mitad del color.
        movk x26, 0x633D, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        movz w7, 0xFF00			// primera mitad del color.
        movk w7, 0x633D, lsl 16		// completa el color.
    	mov x11, 470			// centro coordenada x.
    	mov x12, 345			// centro coordenada y.
    	mov x13, 25			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFF00			// primera mitad del color.
        movk w7, 0x633D, lsl 16		// completa el color.
    	mov x11, 450			// centro coordenada x.
    	mov x12, 370			// centro coordenada y.
    	mov x13, 25			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFF00			// primera mitad del color.
        movk w7, 0x633D, lsl 16		// completa el color.
    	mov x11, 350			// centro coordenada x.
    	mov x12, 360			// centro coordenada y.
    	mov x13, 25			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFF00			// primera mitad del color.
        movk w7, 0x633D, lsl 16		// completa el color.
    	mov x11, 205			// centro coordenada x.
    	mov x12, 330			// centro coordenada y.
    	mov x13, 20			// radio del circulo.
	bl circulo			// funcion llamada.

//---------------------LUNA-----------------------------------------------------------

      //Primer "renglon" de la luna

        mov x29, 0			// punto de partida de x.
        mov x21, 440			// punto de partida de y.
        mov x28, 640			// ancho del rectangulo.
        mov x27, 40			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
        movk x26, 0xFFFF, lsl 16	// completa el color.
        bl rectangulo 			// funcion llamada.

      //Segundo "renglon"

        mov x29, 25			// punto de partida de x.
        mov x21, 420			// punto de partida de y.
        mov x28, 590			// ancho del rectangulo.
        mov x27, 20			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
        movk x26, 0xFFFF, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

      //Tercer "renglon"

        mov x29, 70			// punto de partida de x.
        mov x21, 400			// punto de partida de y.
        mov x28, 500			// ancho del rectangulo.
        mov x27, 20			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
        movk x26, 0xFFFF, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

      //Cuarto "renglon"

        mov x29, 120			// punto de partida de x.
        mov x21, 380			// punto de partida de y.
        mov x28, 400			// ancho del rectangulo.
        mov x27, 20			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
        movk x26, 0xFFFF, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

      //Quinto "renglon"

        mov x29, 190			// punto de partida de x.
        mov x21, 360			// punto de partida de y.
        mov x28, 260			// ancho del rectangulo.
        mov x27, 20			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
	movk x26, 0xFFFF, lsl 16	// completa el color.
	bl rectangulo			// funcion llamada.


//-----------------------------CRATERES LUNA-------------------------

        mov x29, 450			// punto de partida de x.
        mov x21, 380			// punto de partida de y.
        mov x28, 70			// ancho del rectangulo.
        mov x27, 50			// alto del rectangulo.
        movz x26, 0xAEAE		// primera mitad del color.
        movk x26, 0xAEAE, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//------sombra

        mov x29, 460			// punto de partida de x.
        mov x21, 390			// punto de partida de y.
        mov x28, 50			// ancho del rectangulo.
        mov x27, 30			// alto del rectangulo.
        movz x26, 0x8E8B		// primera mitad del color.
        movk x26, 0x8B8B, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//______________________________________________________________________

        mov x29, 65			// punto de partida de x.
        mov x21, 430			// punto de partida de y.
        mov x28, 55			// ancho del rectangulo.
        mov x27, 30			// alto del rectangulo.
        movz x26, 0xAEAE		// primera mitad del color.
        movk x26, 0xAEAE, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//------sombra

        mov x29, 70			// punto de partida de x.
        mov x21, 435			// punto de partida de y.
        mov x28, 40			// ancho del rectangulo.
        mov x27, 20			// alto del rectangulo.
        movz x26, 0x8E8B		// primera mitad del color.
        movk x26, 0x8B8B, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//__________________________________________________________________________________________

        mov x29, 280			// punto de partida de x.
        mov x21, 400			// punto de partida de y.
        mov x28, 100			// ancho del rectangulo.
        mov x27, 100			// alto del rectangulo.
        movz x26, 0xAEAE		// primera mitad del color.
        movk x26, 0xAEAE, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//------sombra

        mov x29, 300			// punto de partida de x.
        mov x21, 420			// punto de partida de y.
        mov x28, 60			// ancho del rectangulo.
        mov x27, 40			// alto del rectangulo.
        movz x26, 0x8E8B		// primera mitad del color.
        movk x26, 0x8B8B, lsl 16	// completa el color.
        bl rectangulo   		// funcion llamada.


//------estrellas

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 80			// centro coordenada x.
    	mov x12, 80			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 140			// centro coordenada x.
    	mov x12, 32			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 377			// centro coordenada x.
    	mov x12, 87			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 538			// centro coordenada x.
    	mov x12, 43			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 320			// centro coordenada x.
    	mov x12, 200			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 350			// centro coordenada x.
    	mov x12, 220			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 500			// centro coordenada x.
    	mov x12, 250			// centro coordenada y.
    	mov x13, 3			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 470			// centro coordenada x.
    	mov x12, 225			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 50			// centro coordenada x.
    	mov x12, 400			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 75			// centro coordenada x.
    	mov x12, 220			// centro coordenada y.
    	mov x13, 3			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 150			// centro coordenada x.
    	mov x12, 174			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 225			// centro coordenada x.
    	mov x12, 250			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 240			// centro coordenada x.
    	mov x12, 100			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 260			// centro coordenada x.
    	mov x12, 80			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 235			// centro coordenada x.
    	mov x12, 230			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 520			// centro coordenada x.
    	mov x12, 45			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 450			// centro coordenada x.
    	mov x12, 280			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 22			// centro coordenada x.
    	mov x12, 312			// centro coordenada y.
    	mov x13, 3			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 615			// centro coordenada x.
    	mov x12, 395			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 543			// centro coordenada x.
    	mov x12, 315			// centro coordenada y.
    	mov x13, 3			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 606			// centro coordenada x.
    	mov x12, 281			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 131			// centro coordenada x.
    	mov x12, 277			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 30			// centro coordenada x.
    	mov x12, 137			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 421			// centro coordenada x.
    	mov x12, 139			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 15			// centro coordenada x.
    	mov x12, 29			// centro coordenada y.
    	mov x13, 3			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 606			// centro coordenada x.
    	mov x12, 98			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 413			// centro coordenada x.
    	mov x12, 176			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 326			// centro coordenada x.
    	mov x12, 9			// centro coordenada y.
    	mov x13, 3			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 13			// centro coordenada x.
    	mov x12, 187			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 540			// centro coordenada x.
    	mov x12, 385			// centro coordenada y.
    	mov x13, 3			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 562			// centro coordenada x.
    	mov x12, 209			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 276			// centro coordenada x.
    	mov x12, 165			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 472			// centro coordenada x.
    	mov x12, 20			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 261			// centro coordenada x.
    	mov x12, 9			// centro coordenada y.
    	mov x13, 4			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 101			// centro coordenada x.
    	mov x12, 354			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 6			// centro coordenada x.
    	mov x12, 384			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 91			// centro coordenada x.
    	mov x12, 150			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 110			// centro coordenada x.
    	mov x12, 369			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 333			// centro coordenada x.
    	mov x12, 41			// centro coordenada y.
    	mov x13, 2			// radio del circulo.
	bl circulo			// funcion llamada.

        movz w7, 0xFFFF, lsl 16		// primera mitad del color.
	movk w7, 0xFFFF, lsl 00		// completa el color.
    	mov x11, 82			// centro coordenada x.
    	mov x12, 267			// centro coordenada y.
    	mov x13, 5			// radio del circulo.
	bl circulo			// funcion llamada.

//------------bandera
//------Mastil

        mov x29, 275			// punto de partida de x.
        mov x21, 260			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 120			// alto del rectangulo.
        movz x26, 0x5453		// primera mitad del color.
        movk x26, 0x5453, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//------Parte CELESTE 1

        mov x29, 285			// punto de partida de x.
        mov x21, 265			// punto de partida de y.
        mov x28, 30			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xEDD7		// primera mitad del color.
        movk x26, 0x85B4, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 315			// punto de partida de x.
        mov x21, 268			// punto de partida de y.
        mov x28, 40			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xEDD7		// primera mitad del color.
        movk x26, 0x85B4, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 355			// punto de partida de x.
        mov x21, 265			// punto de partida de y.
        mov x28, 30			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xEDD7		// primera mitad del color.
        movk x26, 0x85B4, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//------PARTE BLANCA

        mov x29, 285			// punto de partida de x.
        mov x21, 280			// punto de partida de y.
        mov x28, 30			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
        movk x26, 0xFFFF, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 315			// punto de partida de x.
        mov x21, 283			// punto de partida de y.
        mov x28, 40			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
        movk x26, 0xFFFF, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.
        
        mov x29, 355			// punto de partida de x.
        mov x21, 280			// punto de partida de y.
        mov x28, 30			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xFFFF		// primera mitad del color.
        movk x26, 0xFFFF, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//-----PARTE CELESTE 2

        mov x29, 285			// punto de partida de x.
        mov x21, 295			// punto de partida de y.
        mov x28, 30			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xEDD7		// primera mitad del color.
        movk x26, 0x85B4, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 315			// punto de partida de x.
        mov x21, 298			// punto de partida de y.
        mov x28, 40			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xEDD7		// primera mitad del color.
        movk x26, 0x85B4, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 355			// punto de partida de x.
        mov x21, 295			// punto de partida de y.
        mov x28, 30			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0xEDD7		// primera mitad del color.
        movk x26, 0x85B4, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//---------Sol de la bandera

        movz w7, 0xDBFF, lsl 16		// primera mitad del color.
	movk w7, 0xff00, lsl 00		// completa el color.
    	mov x11, 335			// centro coordenada x.
    	mov x12, 290			// centro coordenada y.
    	mov x13, 6			// radio del circulo.
	bl circulo			// funcion llamada.

//---------Sol

        movz w7, 0xDBFF, lsl 16		// primera mitad del color.
	movk w7, 0xff00, lsl 00		// completa el color.
    	mov x11, 550			// centro coordenada x.
    	mov x12, 150			// centro coordenada y.
    	mov x13, 30			// radio del circulo.
	bl circulo			// funcion llamada.

//-------------ODC
//------- O

        mov x29, 295 			// punto de partida de x.
        mov x21, 267			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 295			// punto de partida de x.
        mov x21, 267			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 305			// punto de partida de x.
        mov x21, 267			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 295			// punto de partida de x.
        mov x21, 282			// punto de partida de y.
        mov x28, 13			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//------D

        mov x29, 328			// punto de partida de x.
        mov x21, 270			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 328			// punto de partida de x.
        mov x21, 270			// punto de partida de y.
        mov x28, 8			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 335			// punto de partida de x.
        mov x21, 272			// punto de partida de y.
        mov x28, 4			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 337			// punto de partida de x.
        mov x21, 274			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 10			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 328			// punto de partida de x.
        mov x21, 285			// punto de partida de y.
        mov x28, 8			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 335			// punto de partida de x.
        mov x21, 283			// punto de partida de y.
        mov x28, 4			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//------C

        mov x29, 365			// punto de partida de x.
        mov x21, 267			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 365			// punto de partida de x.
        mov x21, 267			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 365			// punto de partida de x.
        mov x21, 282			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//--------2025
//------2

        mov x29, 287			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 7			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 294			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 10			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 287			// punto de partida de x.
        mov x21, 299			// punto de partida de y.
        mov x28, 7			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 287			// punto de partida de x.
        mov x21, 299			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 7			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 287			// punto de partida de x.
        mov x21, 306			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//--------- 0

        mov x29, 303			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 303			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 313			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 15			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 303			// punto de partida de x.
        mov x21, 306			// punto de partida de y.
        mov x28, 13			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//---------2

        mov x29, 357			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 7			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 364			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 10			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 357			// punto de partida de x.
        mov x21, 299			// punto de partida de y.
        mov x28, 7			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 357			// punto de partida de x.
        mov x21, 299			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 7			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 357			// punto de partida de x.
        mov x21, 306			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

//--------- 5

        mov x29, 373			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 373			// punto de partida de x.
        mov x21, 292			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 10			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 373			// punto de partida de x.
        mov x21, 299			// punto de partida de y.
        mov x28, 7			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 380			// punto de partida de x.
        mov x21, 299			// punto de partida de y.
        mov x28, 3			// ancho del rectangulo.
        mov x27, 7			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

        mov x29, 373			// punto de partida de x.
        mov x21, 306			// punto de partida de y.
        mov x28, 10			// ancho del rectangulo.
        mov x27, 3			// alto del rectangulo.
        movz x26, 0x0000		// primera mitad del color.
        movk x26, 0x0000, lsl 16	// completa el color.
        bl rectangulo			// funcion llamada.

InfLoop:
	b InfLoop


 
