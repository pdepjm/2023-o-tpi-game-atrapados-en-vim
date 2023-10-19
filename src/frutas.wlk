import snake.snake
import wollok.game.*
import controller.*
import posiciones.*

class Fruta{
	var property position = game.at(3,3)
	const property image = "pepita.png"
	method efecto(){
//		var aux = game.at(0.randomUpTo(24).roundUp(),0.randomUpTo(24).roundUp())
//		if(snake.puedoDibujar(aux,self) and aux != position) {
//			position = aux
//		}
//		else {self.efecto()}
		//position = posiciones.todas().filter({pos => pos.allElements().isEmpty()}).anyOne()
		position = controller.getRandomPositionFree()
		self.efectoAdicional()
	}
	method efectoAdicional()
	// Metodo abstracto
}

object manzana inherits Fruta(image = "apple.png") {
	
	override method efectoAdicional(){
		snake.agregarSegmento()
	}
}

object wollokApple inherits Fruta(image = "wollok.png", position = game.at(10,10)){
	override method efectoAdicional(){
		controller.gameOver()
		// A CASA
	}
	
}

object manzanaVeloz inherits Fruta(image = "veloz.png"){
	override method efectoAdicional(){
		controller.cambiarVelocidad()
		game.removeVisual(self)
	}
}
	
	





