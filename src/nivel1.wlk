import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import utilidades.*


object nivelAcuario {
		var property peces
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoverde.png"))
				 
		// otros visuals, p.ej. bloques o llaves
		//game.addVisual(new Bloque(position=game.at(8,8)))
			
		// personaje, es importante que sea el último visual que se agregue
		
		game.addVisual(vidaimagen)
		game.addVisual(vidacentena)
		game.addVisual(vidadecena)
		game.addVisual(vidaunidad)
		game.addVisual(acuario)
		game.addVisual(new Cajasorpresa1(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Cajasorpresa2(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Cajasorpresa3(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Cajasorpresa4(position = utilidades.posicionArbitraria()))
					
		peces = [ new Pez(position = utilidades.posicionArbitraria(),image = "pez1.png"), new Pez(position = utilidades.posicionArbitraria(),image = "pez2.png"), new Pez(position = utilidades.posicionArbitraria(),image = "pez3.png")]
    	peces.forEach({ p => game.addVisual(p)})
		game.addVisual(new Hongo(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Hongo(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Flor(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Flor(position = utilidades.posicionArbitraria()))
    	
		game.addVisual(mario)
		game.showAttributes(mario)
		game.say(mario, "Salvemos a esos peces")
		game.onCollideDo(mario, { o => mario.acciones(o)})
		
		// teclado
		// este es para probar, no es necesario dejarlo
		
		keyboard.up().onPressDo{ mario.irArriba()}
    	keyboard.down().onPressDo{ mario.irAbajo()}
    	keyboard.left().onPressDo{ mario.irIzquierda()}
    	keyboard.right().onPressDo{ mario.irDerecha()}
		keyboard.t().onPressDo({ self.terminar() })
		keyboard.p().onPressDo({ self.perder() })
		//keyboard.any().onPressDo({ self.perder() })
		// en este no hacen falta colisiones
	}
	
	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoverde.png"))
		game.addVisual(mario)
		// después de un ratito ...
		game.schedule(500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="pasamos2.png"))
			// después de un ratito ...
			game.schedule(5000, {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
				nivelMonedas.configurate()
			})
		})
	}
	
	method perder() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoverde.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "perdimos.png"))
      game.schedule(5000, { game.stop()})
    })
  }
		
}

