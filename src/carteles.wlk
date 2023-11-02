import wollok.game.*
import controller.controller

object cartelGameOver {
	var property puntaje = 0
	var property highscores = 0
	method position() = game.at(9,7)
	
	// el cartelito tendria q tener un fondo, este no se ve bien
	
	
	method text() = "
"+"" + puntaje + "                    " + highscores +"
 Precione R para volver a jugar"
	
	method textColor() = "273D5B"
}

object cartelImagenGameOver {
	method image() = "cartel4.png"
	method position() = game.at(6,6)
} 
