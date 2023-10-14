import wollok.game.*
import pepita.*
import snake.*
import frutas.*
import direcciones.*
object controller {
	
	const property  game_width = 25
	const property game_height = 25
	const cell_size = 25
	var highscore =0
	var frutaActiva = manzana

	method highscore() = highscore
	
	method inicializar(){
		game.width(game_width)
		game.height(game_height)
		game.cellSize(cell_size)
		//game.ground("sqaure-icon.png")
	}
	
	
	
	method empezarJuego(){
		game.addVisual(cabeza)
		snake.agregarSegmento()
		snake.agregarSegmento()
		snake.agregarSegmento()
		
		
		game.onTick(100, "mover snake", {snake.mover()})
		
		keyboard.up().onPressDo({ snake.direccion(arriba) })
		keyboard.down().onPressDo({ snake.direccion(abajo) })
		keyboard.right().onPressDo({ snake.direccion(derecha) })
		keyboard.left().onPressDo({ snake.direccion(izquierda) })
		
		game.addVisual(frutaActiva)
		
		game.onCollideDo(cabeza, {elemento => elemento.efecto()})
	}
	
	method gameOver(){
		highscore = highscore.max(snake.score())
		game.clear()
		game.addVisual(pepita)
		game.say(pepita, "Perdiste, tu puntaje fue: " + snake.score().toString() + " toca r para volver a jugar")
		keyboard.r().onPressDo({
			game.clear()
			snake.reiniciar()
			self.empezarJuego()
		})
	}
	
}
