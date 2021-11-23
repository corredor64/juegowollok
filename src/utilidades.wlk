import wollok.game.*

object utilidades{

  method posicionArbitraria() {
    const posicion = game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height() - 1).truncate(0))
    if (game.getObjectsIn(posicion).isEmpty()) return posicion else return self.posicionArbitraria()
  }

}