import wollok.game.*


class Segmento {
	var property segAnterior = null
	
	var property position = game.center()
	method image() = "pepita.png"
	
}

object cabeza inherits Segmento {
	// LOGICA UNICA DE LA CABEZA DE COMER Y ESO
}

object snake {
	// derecha = 1, izquierda = -1, arriba = 2, abajo = -2
	// x ahora lo hardcodeo, dsps estaria bueno definir objetos o algo
	// dejo asi para poder calcular cuando las direcciones son opuestas
	var property direccion = 1
	
	const property segmentos = [cabeza]
	
	method direccion(dir) {
		if (dir + direccion != 0) {
			direccion = dir
		}
	}
	
	method mover() {
		
		// logica ir moviendo todos los segmentos
		segmentos.reverse().forEach({s => 
			if(s.segAnterior() != null) s.position(s.segAnterior().position())
		})
		
		if (self.direccion() == 1) {
			cabeza.position(cabeza.position().right(1))
		}
		else if (self.direccion() == -1) {
			cabeza.position(cabeza.position().left(1))
		}
		else if (self.direccion() == 2) {
			cabeza.position(cabeza.position().up(1))
		}
		else {
			cabeza.position(cabeza.position().down(1))
		}
	}

	method agregarSegmento() {
		segmentos.add(new Segmento(segAnterior = segmentos.last()))
	}	
}