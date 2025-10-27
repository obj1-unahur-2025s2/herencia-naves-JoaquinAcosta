class Naves {
  const velocidadMaxima = 100000
  var velocidad
  var direccion

  method prepararViaje()

  method acelerar(cuanto) {
    velocidad = (velocidad+cuanto).min(velocidadMaxima)
  }

  method desacelerar(cuanto) {
    velocidad = (velocidad-cuanto).max(0)
  }

  method irHaciaElSol() {
    direccion = 10
  }

  method escaparDelSol() {
    direccion = -10
  }

  method ponerseParaleloAlSol() {
    direccion = 0
  }

  method acercarseUnPocoDelSol() {
    direccion = (direccion+1).min(10) 
  }

  method alejarseUnPocoDelSol() {
    direccion = (direccion-1).max(-10)
  }

}

class NavesBaliza inherits Naves {
  var color

  method cambiarColorDeBaliza(colorNuevo) {
    color = colorNuevo
  }

  method color() = color

  override method prepararViaje() {
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
  }
}

class NavesDePasajeros inherits Naves {
  const pasajeros
  var comida
  var bebida

  method cargarComida(cantidad) {
    comida = cantidad
  }

  method descargarComida(cantidad) {
    comida = cantidad
  }

  method cargarBebida(cantidad) {
    bebida = cantidad
  }

  method descargarBebida(cantidad) {
    bebida = cantidad
  }

  override method prepararViaje() {
    self.cargarComida(4 * pasajeros)
    self.cargarBebida(6 * pasajeros)
    self.acercarseUnPocoDelSol()
  }
}

class NavesDeCombate inherits Naves {
  var invisible
  var misiles
  const mensajes = []

  method ponerseVisible() {
    invisible = false
  }

  method ponerseInvisible() {
    invisible = true
  }

  method estaInvisible() =  invisible

  method desplegarMisiles() {
    misiles = true
  }

  method replegarMisiles() {
    misiles = false
  }

  method misilesDesplegados() =  misiles

  method emitirMensaje(mensaje) {
    mensajes.add(mensaje)
  }
  method mensajesEmitidos() = mensajes
  method primerMensajeEmitido() = mensajes.first()
  method ultimoMensajeEmitido() = mensajes.last()
  method esEscueta() = mensajes.all({m => m.length() < 30})
  method emitioMensaje(mensaje) = mensaje.contains(mensaje)

  override method prepararViaje() {
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en mision")
  }

}

