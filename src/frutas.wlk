import snake.snake
import wollok.game.*

object manzana {
	method position() = game.at(3,3)
	method image() = "pepita.png"
	method efecto(){snake.agregarSegmento()}
}

object wollokApple{
	method position() = game.at(3,3)
	method image() = "pepita.png"
}

