import snake.cabeza

class Direccion{
	const property opuesta
	method puedeMoverseHacia(dir) = dir != opuesta && dir !=self
	method moverCabeza()
}

object derecha inherits Direccion(opuesta = izquierda){
	override method moverCabeza(){
		cabeza.position(cabeza.position().right(1))
	}
}

object izquierda inherits Direccion(opuesta = derecha){
	override method moverCabeza(){
		cabeza.position(cabeza.position().left(1))
	}
}

object arriba inherits Direccion(opuesta = abajo){
	override method moverCabeza(){
		cabeza.position(cabeza.position().up(1))
	}
}

object abajo inherits Direccion(opuesta = arriba){
	override method moverCabeza(){
		cabeza.position(cabeza.position().down(1))
	}
}