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
//
//object wollokApple inherits Fruta(image = "wollok.png", position =controller.getRandomPositionFree() ){
//	override method efectoAdicional(){
//		controller.gameOver()
//		// A CASA
//	}
//	
//}
//
//object manzanaVeloz inherits Fruta(image = "veloz.png", position = controller.getRandomPositionFree()){
//	override method efectoAdicional(){
//		controller.cambiarVelocidad()
//		game.removeVisual(self)
//	}
//}
//	
//	
//object manzanaEvil inherits Fruta(image = "manzanaEvil.png",position = controller.getRandomPositionFree()) {
//	override method efectoAdicional() {
//		if(snake.score() > 1) {
//			snake.quitarSegmento()
//			// AGREGAR POSIBLE SONIDO ??? 
//		} else {
//			controller.gameOver()
//		}
//	}
//}


class WollokApple inherits Fruta(image = "wollok.png",position = controller.getRandomPositionFree()){
	const efectos = [{controller.gameOver()},{3.times({n => snake.agregarSegmento()})}]
	override method efectoAdicional(){
		efectos.anyOne().apply()
		// A CASA
		// TODO: EN VEZ DE SOLO PERDER QUIZAS PONER UNA LISTA DE EFECTOS Y QUE HAGA UNO RANDOM 
	}
	
	
}

class ManzanaVeloz inherits Fruta(image = "veloz.png",position = controller.getRandomPositionFree()){
	override method efectoAdicional(){
		controller.cambiarVelocidad()
		game.removeVisual(self)
	}
}
	
	
class ManzanaEvil inherits Fruta(image = "manzanaEvil.png",position = controller.getRandomPositionFree()) {
	override method efectoAdicional() {
		if(snake.score() > 1) {
			snake.quitarSegmento()
		} else {
			controller.gameOver()
		}
	}
}