import wollok.game.*

object cartelGameOver {
	var property puntaje = 0
	
	method position() = game.center()
	
	// el cartelito tendria q tener un fondo, este no se ve bien
//	method image() = "gameOverBackground.png"
	
	method text() = "Perdiste! Tu puntaje fue de " + puntaje + " puntos \n Toca 'R' para jugar de nuevo"	
}
