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



class WollokApple inherits Fruta(image = "wollok.png",position = controller.getRandomPositionFree()){
	const efectos = [{controller.gameOver()},{3.times({n => snake.agregarSegmento()})}]
	override method efectoAdicional(){
		efectos.anyOne().apply()
		
	}
	
}

class ManzanaVeloz inherits Fruta(image = "veloz.png",position = controller.getRandomPositionFree()){
	override method efectoAdicional(){
		controller.cambiarVelocidad()
		new Sound(file = "sonidor2d2.mp3").play()
		game.removeVisual(self)
	}
}
	
	
class ManzanaEvil inherits Fruta(image = "manzanaEvil.png",position = controller.getRandomPositionFree()) {
	override method efectoAdicional() {
			if(snake.score()>1){	
				snake.quitarSegmento()
			}
			else controller.gameOver()
		
	}
}