import snake.snake
import wollok.game.*
import controller.*

class Fruta{
	var property position = game.at(3,3)
	method image() = "pepita.png"
	method efecto(){
		var aux = game.at(0.randomUpTo(24).roundUp(),0.randomUpTo(24).roundUp())
		if(snake.puedoDibujar(aux,self) and aux != position) {
			position = aux
		}
		else {self.efecto()}
		
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

