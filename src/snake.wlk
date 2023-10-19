import wollok.game.*
import direcciones.*
import controller.*

class Segmento {
	var property segAnterior = null
	
	var property position = game.at(50,50)
	method image() = "cuadradito.png"
	method efecto(){controller.gameOver()}
	
	
	
}

object cabeza{
	var property segAnterior = null
	var property position = game.center()
	method image() = "cuadradito.png"
	
	method fueraDelMapa() = not (position.x().between(0,controller.game_width()-1) and position.y().between(0,controller.game_height()-1))
}

object snake {
	var direccion = derecha
	const property segmentos = [cabeza]
	
	
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
		
		if (direccion == derecha) {
			cabeza.position(cabeza.position().right(1))
		}
		else if (direccion == izquierda) {
			cabeza.position(cabeza.position().left(1))
		}
		else if (direccion == arriba) {
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
	
//	method puedoDibujar(posicion,fruta) = segmentos.all({segmento => segmento.position() != posicion})
	
}