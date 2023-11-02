import wollok.game.*
import pepita.*
import snake.*
import frutas.*
import direcciones.*
import carteles.*

object controller {
	
	const property  game_width = 20
	const property game_height = 20
	const cell_size = 32
	var highscore =0
	//const frutas = [manzanaVeloz,wollokApple, manzanaEvil]
	var frutaActiva
	var milisVelocidad
	
	const constructores = [{frutaActiva = new WollokApple()},{frutaActiva = new ManzanaVeloz()},{frutaActiva= new ManzanaEvil()}]
	
	
	method highscore() = highscore
	method inicializar(){
		game.width(game_width)
		game.height(game_height+1)
		game.cellSize(cell_size)
		//game.ground("blanco.png")
	}
	
	
	method estaLibre(position) = position.allElements().isEmpty()
	method getRandomPosition() = game.at(0.randomUpTo(game_width -1).roundUp(),0.randomUpTo(game_height - 1).roundUp())
	method getRandomPositionFree(){
		const aux = self.getRandomPosition()
		if(self.estaLibre(aux)) return aux
		else return self.getRandomPositionFree()
		
	}
	
	method moverHacia(direccion){
		if(snake.direccion().puedeMoverseHacia(direccion)){
			game.removeTickEvent("mover snake")
			snake.direccion(direccion)
			snake.mover()
			game.onTick(milisVelocidad, "mover snake", {
			snake.mover()
			if(cabeza.fueraDelMapa()) self.gameOver()
		})
			
		}
	}
	
	method empezarJuego(){
		game.clear()
		game.addVisual(cabeza)
		game.addVisual(barrita)
		game.addVisual(trofeo)
		game.addVisual(manzanaBarrita)
		snake.agregarSegmento()
		snake.agregarSegmento()
		snake.agregarSegmento()
		
		milisVelocidad = 100
		
		game.onTick(milisVelocidad, "mover snake", {
			snake.mover()
			if(cabeza.fueraDelMapa()){
			self.gameOver()
		}
		})
		
		keyboard.up().onPressDo({self.moverHacia(arriba)})
		
		keyboard.down().onPressDo({self.moverHacia(abajo)})
		
		keyboard.right().onPressDo({self.moverHacia(derecha)})
		
		keyboard.left().onPressDo({self.moverHacia(izquierda)})
		
		manzana.renovarPosicion()
		game.addVisual(manzana)
		
		game.onTick(6000,"aparecer fruta especial",{
			constructores.anyOne().apply()
			game.addVisual(frutaActiva)
		})
		
		game.onCollideDo(cabeza, {elemento => elemento.efecto()})
	}
	
	method gameOver(){
		game.sound("gameover.mp3").play()
		game.removeTickEvent("mover snake")
		game.removeTickEvent("aparecer fruta especial")
		highscore = highscore.max(snake.score())
//		game.addVisual(pepita)
		cartelGameOver.puntaje(snake.score())
		cartelGameOver.highscores(highscore)
		game.addVisual(cartelImagenGameOver)
		game.addVisual(cartelGameOver)
		
		
		
//		game.say(pepita, "Perdiste, tu puntaje fue: " + snake.score().toString() + " toca r para volver a jugar")
		keyboard.any().onPressDo({
			game.clear()
			snake.reiniciar()
			self.empezarJuego()
		})
	}
	
	
method cambiarVelocidad(){
	game.removeTickEvent("mover snake")
	milisVelocidad = 25
	game.onTick(milisVelocidad, "mover snake", {
		snake.mover()
		if(cabeza.fueraDelMapa()){
			self.gameOver()
		}
	})
	game.schedule(10000,{ milisVelocidad = 100})	
	
	}
}



