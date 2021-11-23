import direcciones.*
import elementos.*
import wollok.game.*
import nivel1.*
import nivel2.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object mario {
	var property position = game.at(0,13)
	var property image = "mario.png"	
	var direccion = arriba
  	var property energia = 30
  	
  
  method perderEnergia(cantidad) {
    energia = 0.max(energia - cantidad)    
    vidacentena.actualizar(energia)
    vidadecena.actualizar(energia)
    vidaunidad.actualizar(energia)
    if (energia == 0) {
      nivelAcuario.perder()
    }
  }
  
  method ganarEnergia(cantidad) {
    energia = 999.min(energia + cantidad)  
    vidacentena.actualizar(energia)
    vidadecena.actualizar(energia)
    vidaunidad.actualizar(energia) 
  }
  
  
  method acciones(objeto){
  	objeto.interactuar(direccion)		
  }
  
  
  method irArriba() {
    direccion = arriba
    self.avanzar()    
  }

  method irAbajo() {
    direccion = abajo
    self.avanzar()
  }

  method irIzquierda() {
    direccion = izquierda
    self.avanzar()
    self.image("mario-izq.png")
  }

  method irDerecha() {
    direccion = derecha
    self.avanzar()
    self.image("mario-der.png")
  }
  	method avanzar() {
    position = direccion.siguiente(position)
    self.perderEnergia(1)
  }
  
  	
}


object luigi {
	var property position = game.at(0,13)
	var property image = "luigi.png"	
	var direccion = arriba
  	var property energia = 40
  	var property dinero = 0
  	
  
  method perderEnergia(cantidad) {
    energia = 0.max(energia - cantidad)    
    vidacentena.actualizar(energia)
    vidadecena.actualizar(energia)
    vidaunidad.actualizar(energia)
    if (energia == 0) {
      nivelMonedas.perder()
    }
  }
  
  method ganarEnergia(cantidad) {
    energia = 999.min(energia + cantidad)  
    vidacentena.actualizar(energia)
    vidadecena.actualizar(energia)
    vidaunidad.actualizar(energia) 
  }
  
   method ganarDinero(cantidad) {
    dinero = 999.min(dinero + cantidad)  
    monedacentena.actualizar(dinero)
    monedadecena.actualizar(dinero)
    monedaunidad.actualizar(dinero) 
  }
  
  
  method acciones(objeto){
  	objeto.interactuar(direccion)		
  }
  
  
  method irArriba() {
    direccion = arriba
    self.avanzar()    
  }

  method irAbajo() {
    direccion = abajo
    self.avanzar()
  }

  method irIzquierda() {
    direccion = izquierda
    self.avanzar()
    self.image("luigi-izq.png")
  }

  method irDerecha() {
    direccion = derecha
    self.avanzar()
    self.image("luigi-der.png")
  }
  	method avanzar() {
    position = direccion.siguiente(position)
    self.perderEnergia(1)
  }
  
  	
}


