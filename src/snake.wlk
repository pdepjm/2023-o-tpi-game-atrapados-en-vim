import wollok.game.*


class Snake{
	var property position = game.center()
	method image () = "la imagen de una parte del bicho"
	
	method cambiarPosicion(){} // PONELE
	
}

object cabeza inherits Snake{
	// LOGICA UNICA DE LA CABEZA DE COMER Y ESO
}

// El resto de partes son intancias de la clase SUPONGO