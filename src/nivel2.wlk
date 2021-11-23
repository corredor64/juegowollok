import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import utilidades.*

object nivelMonedas {
	var property tesoro
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondorojo.png"))
				 
		// otros visuals, p.ej. bloques o llaves
			
		// personaje, es importante que sea el último visual que se agregue
		
		
		game.addVisual(vidaimagen)
		game.addVisual(vidacentena)
		game.addVisual(vidadecena)
		game.addVisual(vidaunidad)
		
		game.addVisual(monedaimagen)
		game.addVisual(monedacentena)
		game.addVisual(monedadecena)
		game.addVisual(monedaunidad)
		
		vidacentena.actualizar(40)
		vidadecena.actualizar(40)
		vidaunidad.actualizar(40)
		game.addVisual(new Estrella1(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Estrella2(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Estrella1(position = utilidades.posicionArbitraria()))
    	game.addVisual(new Estrella2(position = utilidades.posicionArbitraria()))
    	tesoro = [ new Monedaazul(position = utilidades.posicionArbitraria()), new Monedaazul(position = utilidades.posicionArbitraria()), new Monedaestrella(position = utilidades.posicionArbitraria()), new Monedaestrella(position = utilidades.posicionArbitraria())]
    	tesoro.forEach({ t => game.addVisual(t)})
		
		game.addVisual(luigi)
		game.showAttributes(luigi)
		game.say(luigi, "Luigi juntemos monedas")
		game.onCollideDo(luigi, { o => luigi.acciones(o)})
		
		// teclado
		
		keyboard.up().onPressDo{ luigi.irArriba()}
    	keyboard.down().onPressDo{ luigi.irAbajo()}
    	keyboard.left().onPressDo{ luigi.irIzquierda()}
    	keyboard.right().onPressDo{ luigi.irDerecha()}
		
		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })

		// colisiones, acá sí hacen falta
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondorojo.png"))
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="ganamos.png"))
			// después de un ratito ...
			game.schedule(5000, {
				// fin del juego
				game.stop()
			})
		})
	}
	
	method perder() {
    game.clear()
    game.addVisual(new Fondo(image = "fondorojo.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "perdimos.png"))
      game.schedule(5000, { game.stop()})
    })
  }
	
	
}
