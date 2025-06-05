        .equ SCREEN_WIDTH,640
        .equ SCREEN_HEIGH,480
        .equ BITS_PER_PIXEL,32

        .extern rectangulo
        .extern circulo

        .globl main
        .globl rectangulo
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

        stur w11,[x0]// Colorear el pixel
        add x0,x0,4// Siguiente pixel
        sub x1,x1,1// Decrementar contador X
        cbnz x1,loop0// Si no terminó la fila, salto
        sub x2,x2,1// Decrementar contador Y
        cbnz x2,loop1// Si no es la última fila, salto


//----------TIERRA

        movz w7, 0x433F, lsl 16		// defino color
	movk w7, 0x7AFF, lsl 00		// completo color
    	mov x11, 320		// centro x
    	mov x12, 480		// centro y
    	mov x13, 230		// radio
	bl circulo

//----------CONTINENTES

        mov x29, 210
        mov x21, 310
        mov x28, 50
        mov x27, 80
        movz x26, 0xFF00
        movk x26, 0x633D, lsl #16
        bl rectangulo

        mov x29, 260
        mov x21, 315
        mov x28, 40
        mov x27, 40
        movz x26, 0xFF00
        movk x26, 0x633D, lsl #16
        bl rectangulo

        mov x29, 190
        mov x21, 315
        mov x28, 20
        mov x27, 30
        movz x26, 0xFF00
        movk x26, 0x633D, lsl #16
        bl rectangulo

        mov x29, 350
        mov x21, 320
        mov x28, 120
        mov x27, 50
        movz x26, 0xFF00
        movk x26, 0x633D, lsl #16
        bl rectangulo

        movz w7, 0xFF00
        movk w7, 0x633D, lsl #16
    	mov x11, 470		// centro x
    	mov x12, 345		// centro y
    	mov x13, 25		// radio
	bl circulo

        movz w7, 0xFF00
        movk w7, 0x633D, lsl #16
    	mov x11, 450		// centro x
    	mov x12, 370		// centro y
    	mov x13, 25		// radio
	bl circulo

        movz w7, 0xFF00
        movk w7, 0x633D, lsl #16
    	mov x11, 350		// centro x
    	mov x12, 360		// centro y
    	mov x13, 25		// radio
	bl circulo

        movz w7, 0xFF00
        movk w7, 0x633D, lsl #16
    	mov x11, 205		// centro x
    	mov x12, 330		// centro y
    	mov x13, 20		// radio
	bl circulo

//---------------------LUNA-----------------------------------------------------------

      //Primer "renglon" de la luna

        mov x29, 0// offset en x
        mov x21, 440// offset en y
        mov x28, 640// Anchura
        mov x27, 40// Altura
        movz x26, 0xFFFF// Colorea la mitad de blanco
        movk x26, 0xFFFF, lsl #16// termina de colorear la mitad restante
        bl rectangulo //llamo la funcion rectangulo

      //Segundo "renglon"

        mov x29, 25// offset en x
        mov x21, 420// offset en y
        mov x28, 590// Anchura
        mov x27, 20// Altura
        movz x26, 0xFFFF
        movk x26, 0xFFFF, lsl #16
        bl rectangulo

      //Tercer "renglon"

        mov x29, 70// offset en x
        mov x21, 400// offset en y
        mov x28, 500// Anchura
        mov x27, 20// Altura
        movz x26, 0xFFFF
        movk x26, 0xFFFF, lsl #16
        bl rectangulo

      //Cuarto "renglon"

        mov x29, 120// offset en x
        mov x21, 380// offset en y
        mov x28, 400// Anchura
        mov x27, 20// Altura
        movz x26, 0xFFFF
        movk x26, 0xFFFF, lsl #16
        bl rectangulo

      //Quinto "renglon"

        mov x29, 190// offset en x
        mov x21, 360// offset en y
        mov x28, 260// Anchura
        mov x27, 20// Altura
        movz x26, 0xFFFF
	movk x26, 0xFFFF, lsl #16
	bl rectangulo


//-----------------------------CRATERES LUNA-------------------------

        mov x29, 450
        mov x21, 380
        mov x28, 70
        mov x27, 50
        movz x26, 0xAEAE
        movk x26, 0xAEAE, lsl #16
        bl rectangulo

//------sombra

        mov x29, 460
        mov x21, 390
        mov x28, 50
        mov x27, 30
        movz x26, 0x8E8B
        movk x26, 0x8B8B, lsl #16
        bl rectangulo

//______________________________________________________________________

        mov x29, 65
        mov x21, 430
        mov x28, 55
        mov x27, 30
        movz x26, 0xAEAE
        movk x26, 0xAEAE, lsl #16
        bl rectangulo

//------sombra

        mov x29, 70
        mov x21, 435
        mov x28, 40
        mov x27, 20
        movz x26, 0x8E8B
        movk x26, 0x8B8B, lsl #16
        bl rectangulo

//__________________________________________________________________________________________

        mov x29, 280
        mov x21, 400
        mov x28, 100
        mov x27, 100
        movz x26, 0xAEAE
        movk x26, 0xAEAE, lsl #16
        bl rectangulo

//------sombra

        mov x29, 300
        mov x21, 420
        mov x28, 60
        mov x27, 40
        movz x26, 0x8E8B
        movk x26, 0x8B8B, lsl #16
        bl rectangulo   


//------estrellas

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 80		// centro x
    	mov x12, 80		// centro y
    	mov x13, 5		// radio
	bl circulo	

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 140		// centro x
    	mov x12, 32		// centro y
    	mov x13, 2		// radio
	bl circulo	

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 377		// centro x
    	mov x12, 87		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 538		// centro x
    	mov x12, 43		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 320		// centro x
    	mov x12, 200		// centro y
    	mov x13, 2		// radio
	bl circulo
/*
        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 220		// centro x
    	mov x12, 350		// centro y
    	mov x13, 2		// radio
	bl circulo
*/
        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 350		// centro x
    	mov x12, 220		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 500		// centro x
    	mov x12, 250		// centro y
    	mov x13, 3		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 470		// centro x
    	mov x12, 225		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 50		// centro x
    	mov x12, 400		// centro y
    	mov x13, 5		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 75		// centro x
    	mov x12, 220		// centro y
    	mov x13, 3		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 150		// centro x
    	mov x12, 174		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 225		// centro x
    	mov x12, 250		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 240		// centro x
    	mov x12, 100		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 260		// centro x
    	mov x12, 80             //centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 235            // centro x
    	mov x12, 230		// centro y
    	mov x13, 2              // radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 520		// centro x
    	mov x12, 45		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 450		// centro x
    	mov x12, 280		// centro y
    	mov x13, 5		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 22		// centro x
    	mov x12, 312		// centro y
    	mov x13, 3		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 615		// centro x
    	mov x12, 395		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 543		// centro x
    	mov x12, 315		// centro y
    	mov x13, 3		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 606		// centro x
    	mov x12, 281		// centro y
    	mov x13, 5		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 131		// centro x
    	mov x12, 277		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 30		// centro x
    	mov x12, 137		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 421		// centro x
    	mov x12, 139		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 15		// centro x
    	mov x12, 29		// centro y
    	mov x13, 3		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 606		// centro x
    	mov x12, 98		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 413		// centro x
    	mov x12, 176		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 326		// centro x
    	mov x12, 9		// centro y
    	mov x13, 3		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 13		// centro x
    	mov x12, 187		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 540		// centro x
    	mov x12, 385		// centro y
    	mov x13, 3		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 562		// centro x
    	mov x12, 209		// centro y
    	mov x13, 5		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 276		// centro x
    	mov x12, 165		// centro y
    	mov x13, 5		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 472		// centro x
    	mov x12, 20		// centro y
    	mov x13, 5		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 261		// centro x
    	mov x12, 9		// centro y
    	mov x13, 4		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 101		// centro x
    	mov x12, 354		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 6		// centro x
    	mov x12, 384		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 91		// centro x
    	mov x12, 150		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 110		// centro x
    	mov x12, 369		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 333		// centro x
    	mov x12, 41		// centro y
    	mov x13, 2		// radio
	bl circulo

        movz w7, 0xFFFF, lsl 16		// defino color
	movk w7, 0xFFFF, lsl 00		// completo color
    	mov x11, 82		// centro x
    	mov x12, 267		// centro y
    	mov x13, 5		// radio
	bl circulo

//------------bandera
//------Mastil

        mov x29, 275 
        mov x21, 260
        mov x28, 10
        mov x27, 120
        movz x26, 0x5453
        movk x26, 0x5453, lsl #16
        bl rectangulo

//------Parte CELESTE 1

        mov x29, 285 
        mov x21, 265
        mov x28, 30
        mov x27, 15
        movz x26, 0xEDD7        
        movk x26, 0x85B4, lsl #16
        bl rectangulo

        mov x29, 315 
        mov x21, 268
        mov x28, 40
        mov x27, 15
        movz x26, 0xEDD7        
        movk x26, 0x85B4, lsl #16
        bl rectangulo

        mov x29, 355 
        mov x21, 265
        mov x28, 30
        mov x27, 15
        movz x26, 0xEDD7        
        movk x26, 0x85B4, lsl #16
        bl rectangulo

//------PARTE BLANCA

        mov x29, 285 
        mov x21, 280
        mov x28, 30
        mov x27, 15
        movz x26, 0xFFFF        
        movk x26, 0xFFFF, lsl #16
        bl rectangulo

        mov x29, 315 
        mov x21, 283
        mov x28, 40
        mov x27, 15
        movz x26, 0xFFFF        
        movk x26, 0xFFFF, lsl #16
        bl rectangulo
        
        mov x29, 355 
        mov x21, 280
        mov x28, 30
        mov x27, 15
        movz x26, 0xFFFF        
        movk x26, 0xFFFF, lsl #16
        bl rectangulo

//-----PARTE CELESTE 2

        mov x29, 285
        mov x21, 295
        mov x28, 30
        mov x27, 15
        movz x26, 0xEDD7        
        movk x26, 0x85B4, lsl #16
        bl rectangulo

        mov x29, 315 
        mov x21, 298
        mov x28, 40
        mov x27, 15
        movz x26, 0xEDD7        
        movk x26, 0x85B4, lsl #16
        bl rectangulo

        mov x29, 355 
        mov x21, 295
        mov x28, 30
        mov x27, 15
        movz x26, 0xEDD7        
        movk x26, 0x85B4, lsl #16
        bl rectangulo

//---------Sol de la bandera

        movz w7, 0xDBFF, lsl 16		// defino color
	movk w7, 0xff00, lsl 00		// completo color
    	mov x11, 335		// centro x
    	mov x12, 290		// centro y
    	mov x13, 6		// radio
	bl circulo

//---------Sol

        movz w7, 0xDBFF, lsl 16		// defino color
	movk w7, 0xff00, lsl 00		// completo color
    	mov x11, 550		// centro x
    	mov x12, 150		// centro y
    	mov x13, 30		// radio
	bl circulo

//-------------ODC
//------- O

        mov x29, 295 
        mov x21, 267
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 295 
        mov x21, 267
        mov x28, 3
        mov x27, 15
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 305 
        mov x21, 267
        mov x28, 3
        mov x27, 15
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 295 
        mov x21, 282
        mov x28, 13
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

//------D

        mov x29, 328 
        mov x21, 270
        mov x28, 3
        mov x27, 15
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 328 
        mov x21, 270
        mov x28, 8
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 335
        mov x21, 272
        mov x28, 4
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 337 
        mov x21, 274
        mov x28, 3
        mov x27, 10
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 328 
        mov x21, 285
        mov x28, 8
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 335 
        mov x21, 283
        mov x28, 4
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

//------C

        mov x29, 365 
        mov x21, 267
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 365 
        mov x21, 267
        mov x28, 3
        mov x27, 15
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 365 
        mov x21, 282
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

//--------2025
//------2

        mov x29, 287 
        mov x21, 292
        mov x28, 7
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 294 
        mov x21, 292
        mov x28, 3
        mov x27, 10
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 287 
        mov x21, 299
        mov x28, 7
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 287 
        mov x21, 299
        mov x28, 3
        mov x27, 7
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 287 
        mov x21, 306
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

//--------- 0

        mov x29, 303 
        mov x21, 292
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 303 
        mov x21, 292
        mov x28, 3
        mov x27, 15
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 313 
        mov x21, 292
        mov x28, 3
        mov x27, 15
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 303 
        mov x21, 306
        mov x28, 13
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

//---------2

        mov x29, 357 
        mov x21, 292
        mov x28, 7
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 364 
        mov x21, 292
        mov x28, 3
        mov x27, 10
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 357 
        mov x21, 299
        mov x28, 7
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 357 
        mov x21, 299
        mov x28, 3
        mov x27, 7
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 357 
        mov x21, 306
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

//--------- 5

        mov x29, 373 
        mov x21, 292
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 373 
        mov x21, 292
        mov x28, 3
        mov x27, 10
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 373 
        mov x21, 299
        mov x28, 7
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 380 
        mov x21, 299
        mov x28, 3
        mov x27, 7
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

        mov x29, 373 
        mov x21, 306
        mov x28, 10
        mov x27, 3
        movz x26, 0x0000        
        movk x26, 0x0000, lsl #16
        bl rectangulo

InfLoop:
	b InfLoop
