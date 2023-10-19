import wollok.game.*
import pepita.*
import snake.*
import frutas.*
import direcciones.*
object controller {
	
	const property  game_width = 20
	const property game_height = 20
	const cell_size = 32
	var highscore =0
	const frutas = [manzanaVeloz,wollokApple]
	var frutaActiva 
	var seEstaMoviendo
	method highscore() = highscore
	
	method inicializar(){
		game.width(game_width)
		game.height(game_height)
		game.cellSize(cell_size)
		//game.ground("blanco.png")
	}
	
	
	method estaLibre(position) = position.allElements().isEmpty()
	method getRandomPosition() = game.at(0.randomUpTo(game_width -1).roundUp(),0.randomUpTo(game_height - 1).roundUp())
	method getRandomPositionFree(){
		var aux = self.getRandomPosition()
		if(self.estaLibre(aux)) return aux
		else return self.getRandomPositionFree()
		
	}
	method empezarJuego(){
		game.addVisual(cabeza)
		snake.agregarSegmento()
		snake.agregarSegmento()
		snake.agregarSegmento()
		
		
		game.onTick(100, "mover snake", {
			snake.mover()
			if(cabeza.fueraDelMapa()){
			self.gameOver()
		}
		})
		
		keyboard.up().onPressDo({ snake.direccion(arriba) })
		keyboard.down().onPressDo({snake.direccion(abajo) })
		keyboard.right().onPressDo({snake.direccion(derecha) })
		keyboard.left().onPressDo({snake.direccion(izquierda) })
		
		game.addVisual(manzana)
		
		game.onTick(10000,"aparecer fruta especial",{
			frutaActiva = frutas.anyOne()
			if(not game.hasVisual(frutaActiva)){
				game.addVisual(frutaActiva)
			}
			
		})
		
		game.onCollideDo(cabeza, {elemento => elemento.efecto()})
	}
	
	method gameOver(){
		game.removeTickEvent("mover snake")
		game.removeTickEvent("aparecer fruta especial")
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
	
method cambiarVelocidad(){
	game.removeTickEvent("mover snake")
	game.onTick(25, "mover snake", {
		snake.mover()
		if(cabeza.fueraDelMapa()){
			self.gameOver()
		}
	})
	game.schedule(10000,{
		game.removeTickEvent("mover snake")
		game.onTick(100, "mover snake", {
		snake.mover()
		if(cabeza.fueraDelMapa()){
			self.gameOver()
		}
		})
	})
}	
}



