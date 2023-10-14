import snake.snake
import wollok.game.*
import controller.*
import posiciones.*
class Fruta{
	var property position = game.at(21,12)
	method image() = "pepita.png"
	method efecto(){
//		var aux = game.at(0.randomUpTo(24).roundUp(),0.randomUpTo(24).roundUp())
//		if(snake.puedoDibujar(aux,self) and aux != position) {
//			position = aux
//		}
//		else {self.efecto()}
		//position = posiciones.todas().filter({pos => pos.allElements().isEmpty()}).anyOne()
		position = game.at(0.randomUpTo(24).roundUp(),0.randomUpTo(24).roundUp())
	}
	
}

object manzana inherits Fruta {
	
	override method efecto(){
		super()
		snake.agregarSegmento()
	}
}

object wollokApple inherits Fruta{
	override method efecto(){
		super()
		//ALGO
	}
	
}
	
	





