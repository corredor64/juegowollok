import wollok.game.*
import nivel1.*
import personajes.*
import nivel2.*
import utilidades.*

/*class Bloque {
	var property position
	const property image = "pez3.png" 	
	
	// agregar comportamiento	
}*/



object vidaimagen {

  var property position = game.at(0, game.width() - 1)
  var property image = "nivelvida.png"
   
}


object vidacentena {

  var property position = game.at(1, game.width() - 1)
  var property image = "0.png"
  method actualizar(valor){
  	var lista = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png"]
  	var numero = (valor / 100).truncate(0)
    image = lista.get(numero)	
	}

}

object vidadecena {

  var property position = game.at(2, game.width() - 1)
  var property image = "3.png"
  method actualizar(valor){
  	var lista = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png"]
  	var numero = ((valor % 100) / 10).truncate(0)
    image = lista.get(numero)	
	}
}
  
 object vidaunidad{

  var property position = game.at(3, game.width() - 1)
  var property image = "0.png"
  method actualizar(valor){
  	var lista = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png"]
  	var numero = (valor % 100) % 10
    image = lista.get(numero)	
	}     
}

object monedaimagen {

  var property position = game.at(5, game.width() - 1)
  var property image = "niveldinero.png"
   
}


object monedacentena {

  var property position = game.at(6, game.width() - 1)
  var property image = "0.png"
  method actualizar(valor){
  	var lista = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png"]
  	var numero = (valor / 100).truncate(0)
    image = lista.get(numero)	
	}

}

object monedadecena {

  var property position = game.at(7, game.width() - 1)
  var property image = "0.png"
  method actualizar(valor){
  	var lista = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png"]
  	var numero = ((valor % 100) / 10).truncate(0)
    image = lista.get(numero)	
	}
}
  
 object monedaunidad {

  var property position = game.at(8, game.width() - 1)
  var property image = "0.png"
  method actualizar(valor){
  	var lista = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png"]
  	var numero = (valor % 100) % 10
    image = lista.get(numero)	
	}     
}


object acuario {

  const property ancho = 5
  const property alto = 4
  const property position = game.at(1.randomUpTo(game.width() - ancho - 1).truncate(0), 1.randomUpTo(game.height() - alto - 2).truncate(0))
  const property image = "acuario.png"

  method interactuar(direccion){}
  method puedePisarte(_) = true
  }
  
 class Pez{

  var property position
  const property image = "pez3.png"
  method estaBienPosicionada() = self.position().x().between(acuario.position().x(), acuario.position().x() + acuario.ancho() - 1) and self.position().y().between(acuario.position().y(), acuario.position().y() + acuario.alto() - 1)
	
  method interactuar(direccion) {
    if (self.puedoMoverme(direccion)) {
      position = direccion.siguiente(position)
    }
    if (nivelAcuario.peces().all{ p => p.estaBienPosicionada() }) {
      game.say(mario, "GANASTE!")
      game.schedule(1000, { nivelAcuario.terminar()})
    }
  }
  method puedePisarte(_) = false

  method puedoMoverme(direccion) {
    const poslindante = direccion.siguiente(position)
    return game.getObjectsIn(poslindante).all({ obj => obj.puedePisarte(self) })
  }
  
 }
 
class Elemento {
	var property position
	method image()
	method cantidadQueOtorga()
	method interactuar(direccion)
	method puedePisarte(_) = false
} 


class Hongo inherits Elemento {

  override method image() = "hongo.png"

  override method cantidadQueOtorga() = 10

  override method interactuar(direccion) {
    mario.ganarEnergia(self.cantidadQueOtorga())
    game.removeVisual(self)
  }

}

class Flor inherits Hongo {

  override method image() = "flor.png"

  override method cantidadQueOtorga() = 20

  override method interactuar(direccion) {
    mario.ganarEnergia(self.cantidadQueOtorga())
    game.removeVisual(self)
  }

}

class Estrella1 inherits Hongo {

  override method image() = "estrella1.png"

  override method cantidadQueOtorga() = 50

  override method interactuar(direccion) {
    luigi.ganarEnergia(self.cantidadQueOtorga())
    game.removeVisual(self)
  }

}

class Estrella2 inherits Estrella1 {

  override method image() = "estrella2.png"

  override method cantidadQueOtorga() = 20 
}

class Monedaazul inherits Elemento {

  override method image() = "monedaazul.png"  

  override method cantidadQueOtorga() = 30

  override method interactuar(direccion) {
    game.removeVisual(self)
    luigi.ganarDinero(self.cantidadQueOtorga())
    luigi.perderEnergia(20)
    nivelMonedas.tesoro().remove(self)
    if (nivelMonedas.tesoro().isEmpty()) {
      game.addVisual(new Salida(position = utilidades.posicionArbitraria()))
    }
   
  }

}

/*class Monedaazul inherits Monedaroja {

  override method image() = "monedaazul.png"

  override method cantidadQueOtorga() = 40
}*/

class Monedaestrella inherits Monedaazul {

  override method image() = "monedaEstrella.png"

  override method cantidadQueOtorga() = 50 
  
}


class Salida inherits Elemento {

  override method image() = "salida.png"

  override method cantidadQueOtorga() = 0

  override method interactuar(direccion) {
    game.say(luigi, "GANASTE!!!")
    game.schedule(1000, { nivelMonedas.ganar()})
  }

}

class Cajasorpresa1 inherits Elemento{
	override method image() = "sorpresa.png" 
	override method cantidadQueOtorga() = 30
	override method interactuar(direccion) {
    game.removeVisual(self)
    mario.ganarEnergia(self.cantidadQueOtorga())    
  }
	
}

class Cajasorpresa2 inherits Cajasorpresa1{
	override method cantidadQueOtorga() = 15
	override method interactuar(direccion) {
    game.removeVisual(self)
    mario.perderEnergia(self.cantidadQueOtorga())
    
  }
	
}

class Cajasorpresa3 inherits Cajasorpresa1{
	override method interactuar(direccion) {
    game.addVisual(new Flor(position = utilidades.posicionArbitraria()))
    game.removeVisual(self)
  }
	
}

class Cajasorpresa4 inherits Cajasorpresa1{
	override method interactuar(direccion) {
    game.removeVisual(self)
    game.say(mario, "¿Donde estoy?")
    mario.position(utilidades.posicionArbitraria())
  }
	
}


