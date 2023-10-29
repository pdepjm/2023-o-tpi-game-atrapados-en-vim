import wollok.game.*
import direcciones.*
import controller.*

class Segmento {
	var property segAnterior = null
	
	var property position = game.at(50,50)
	var property image = "cuadradito.png"
	method efecto(){controller.gameOver()}
	//method text() = "soy un segmento"
	
	
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
		direccion.moverCabeza()
	}

	method agregarSegmento() {
		segmentos.add(new Segmento(segAnterior = segmentos.last()))
		game.addVisual(segmentos.last())
	}
	
	method quitarSegmento() {
		segmentos.last().image("cartman.png") //provisorio
		segmentos.remove(segmentos.last())
	}
}