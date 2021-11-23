import wollok.game.*

class Direccion {

  method siguiente(position)

  method opuesto()

}

object izquierda inherits Direccion {

  override method siguiente(position) = if (position.left(1).x() < 0) position.right(game.width() - 1) else position.left(1)

  override method opuesto() = derecha

}

object derecha inherits Direccion {

  override method siguiente(position) = if (position.right(1).x() > game.width() - 1) position.left(game.width() - 1) else position.right(1)

  override method opuesto() = izquierda

}

object abajo inherits Direccion {

  override method siguiente(position) = if (position.down(1).y() < 0) position.up(game.height() - 2) else position.down(1)

  override method opuesto() = arriba

}

object arriba inherits Direccion {

  override method siguiente(position) = if (position.up(1).y() > game.height() - 2) position.down(game.height() - 2) else position.up(1)

  override method opuesto() = abajo

}

