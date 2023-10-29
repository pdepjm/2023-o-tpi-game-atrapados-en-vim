import snake.snake
import wollok.game.*
import controller.*

class Fruta {
	var property position = game.at(3,3)
	const property image = "pepita.png"
	
	method renovarPosicion() {
		position = controller.getRandomPositionFree()
	}
	
	method efecto(){
//		var aux = game.at(0.randomUpTo(24).roundUp(),0.randomUpTo(24).roundUp())
//		if(snake.puedoDibujar(aux,self) and aux != position) {
//			position = aux
//		}
//		else {self.efecto()}
		//position = posiciones.todas().filter({pos => pos.allElements().isEmpty()}).anyOne()
		self.renovarPosicion()
		self.efectoAdicional()
	}
	method efectoAdicional()
	// Metodo abstracto
}

object manzana inherits Fruta(image = "apple.png") {
	
	override method efectoAdicional(){
		new Sound(file = "mlem-sonido.mp3").play()
		snake.agregarSegmento()
	}
}

object wollokApple inherits Fruta(image = "wollok.png", position =controller.getRandomPositionFree() ){
	override method efectoAdicional(){
		controller.gameOver()
		// A CASA
	}
	
}

object manzanaVeloz inherits Fruta(image = "veloz.png", position = controller.getRandomPositionFree()){
	override method efectoAdicional(){
		controller.cambiarVelocidad()
		game.removeVisual(self)
	}
}
	
	
object manzanaEvil inherits Fruta(image = "manzanaEvil.png",position = controller.getRandomPositionFree()) {
	override method efectoAdicional() {
		if(snake.score() > 1) {
			snake.quitarSegmento()
		} else {
			controller.gameOver()
		}
	}
}

// prueba con clases
//class WollokApple inherits Fruta(image = "wollok.png", position = game.at(10,10)){
//	override method efectoAdicional(){
//		controller.gameOver()
//		// A CASA
//	}
//	
//}
//
//class ManzanaVeloz inherits Fruta(image = "veloz.png"){
//	override method efectoAdicional(){
//		controller.cambiarVelocidad()
//		game.removeVisual(self)
//	}
//}
//	
//	
//class ManzanaEvil inherits Fruta(image = "manzanaEvil.png") {
//	override method efectoAdicional() {
//		if(snake.score() > 1) {
//			snake.quitarSegmento()
//		} else {
//			controller.gameOver()
//		}
//	}
//}