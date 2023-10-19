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
		position = controller.getRandomPosition()
	}
	
}

object manzana inherits Fruta(image = "apple.png") {
	
	override method efecto(){
		super()
		snake.agregarSegmento()
	}
}

object wollokApple inherits Fruta(image = "wollok.png"){
	override method efecto(){
		super()
		controller.gameOver()
		// A CASA
	}
	
}

object manzanaVeloz inherits Fruta(image = "veloz.png"){
	override method efecto(){
		super()
		controller.cambiarVelocidad()
		game.removeVisual(self)
	}
}
	
	





