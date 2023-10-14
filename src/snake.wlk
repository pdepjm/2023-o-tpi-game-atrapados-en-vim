import wollok.game.*
import direcciones.*
import controller.*

class Segmento {
	var property segAnterior = null
	
	var property position = game.at(50,50)
	method image() = "cuadradito.png"
	method efecto(){controller.gameOver()}
	
}

const cabeza = new Segmento(position = game.center())

object snake {
	// derecha = 1, izquierda = -1, arriba = 2, abajo = -2
	// x ahora lo hardcodeo, dsps estaria bueno definir objetos o algo
	// dejo asi para poder calcular cuando las direcciones son opuestas
	var property direccion = derecha
	const segmentos = [cabeza]
	
	
	method score() = segmentos.size()
	
	method reiniciar(){
		segmentos.removeAllSuchThat({segmento => segmento != cabeza})
		cabeza.position(game.center())
		direccion = derecha
	}
	
	method direccion(dir) {
		if (direccion.puedeMoverseHacia(dir)) {
			direccion = dir
		}
	}
	
	method mover() {
		
		// logica ir moviendo todos los segmentos
		segmentos.reverse().forEach({s => 
			if(s.segAnterior() != null) s.position(s.segAnterior().position())
		})
		
		if (self.direccion() == derecha) {
			cabeza.position(cabeza.position().right(1))
		}
		else if (self.direccion() == izquierda) {
			cabeza.position(cabeza.position().left(1))
		}
		else if (self.direccion() == arriba) {
			cabeza.position(cabeza.position().up(1))
		}
		else {
			cabeza.position(cabeza.position().down(1))
		}
	}

	method agregarSegmento() {
		segmentos.add(new Segmento(segAnterior = segmentos.last()))
		game.addVisual(segmentos.last())
	}
	
	method puedoDibujar(posicion,fruta) = segmentos.all({segmento => segmento.position() != posicion})
	
}