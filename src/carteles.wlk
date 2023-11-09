import wollok.game.*
import controller.controller
import snake.snake

object cartelGameOver {
	var property puntaje = 0
	var property highscores = 4
	method position() = game.at(9,7)
	
	// el cartelito tendria q tener un fondo, este no se ve bien
	
	
	method text() = "
"+"" + puntaje + "                    " + highscores +"
Toque una tecla para jugar"
	
	method textColor() = "273D5B"
}

object cartelImagenGameOver {
	method image() = "cartel4.png"
	method position() = game.at(6,6)
} 
object barrita {
	method image() = "barrita.png"
	method position() = game.at(0,20)
	method textColor() = "FFFFFF"
	method text() = "
                       WOLLOK SNAKE"
	
}
object manzanaBarrita {
	method image() = "apple.png"
	method position() = game.at(15,20)
	method textColor() = "FFFFFF"
	method text() = "     
      " + snake.score()
}
object trofeo {
	method image() = "trofeo.png"
	method position() = game.at(17,20)
	method textColor() = "FFFFFF"
	method text() = "      
      "+ cartelGameOver.highscores()
}