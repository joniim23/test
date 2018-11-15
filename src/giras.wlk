import gastronomicos.*

class Gira {
	var bodegones = []
	var restaurantes = []
	var alumnos = []
	
	method agregarAlumnos() = alumnos.addAll( self.alumnosBuenaOnda() )
	method alumnosBuenaOnda() = alumnos.filter{ alumno => alumno.esBuenaOnda() }
	
	method agregarBodegon( bodegon ) = bodegones.add(bodegon)
	method agregarRestaurantes( restaurant ) = restaurantes.add(restaurant)
	
	method participantes() = self.alumnosBuenaOnda().size()
	
	method valeLaPena() = self.bodegonesValenLaPena() && self.restaurantesValenLaPena()
	method bodegonesValenLaPena() = bodegones.all{ bodegon => bodegon.siValeLaPena(self.participantes()) }
	method restaurantesValenLaPena() = restaurantes.all{ restaurant => restaurant.siValeLaPena() }
}

class Bodegon {
	var property variedadDeComidas = 0
	
	method siValeLaPena(clientes) = variedadDeComidas >= clientes
}

class Restaurant {
	var property calificacion = 0
	var property chef = null
	
	method siValeLaPena() = calificacion >= 3 && chef.valeLaPena()
}

class Chef {
	var property profesion = null
	
	method valeLaPena() = escuelaDeGastronomia.esChefDeEscuela(self) or profesion == trabajarEnTv 
}

class RestaurantEtnico inherits Restaurant {
	var property ubicacionEsExotica = false
	
	override method siValeLaPena() = ubicacionEsExotica
}