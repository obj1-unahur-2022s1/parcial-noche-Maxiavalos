//La Hamburgesa de carne siempre tenia que tener un método peso que retorne 250
class Plato {
	//var property peso = 0
	method peso()
	method valoracion()	
	method esAptoParaVegetarianos()
	method esAbundante()= self.peso() > 250
	
}

class Provoleta inherits Plato{
	const property tieneEspecias
	const property peso
	
	override method esAptoParaVegetarianos() = not self.tieneEspecias()
	method esEspecial()= self.esAbundante() or self.tieneEspecias()
	override method valoracion(){
		if (self.esEspecial()){return 120}
		else {return 80}
	}
}

class HamburguesaDeCarne inherits Plato{
	var valoracionDelPan
	override method peso() = 250
	override method esAptoParaVegetarianos()= false

	
	override method valoracion()= 60 + valoracionDelPan.puntos()
	
}

object panIndustrial{
	method puntos()= 0
}

object panCasero{
	method puntos()= 20
}

object panDeMasa{
	method puntos()= 45
}


class HamburguesasVegetarianas inherits HamburguesaDeCarne{
	var property deQueLegumbre
	override method esAptoParaVegetarianos()= true
	override method valoracion()= super() + 17.min(2 * self.deQueLegumbre().size())
		
}


class Cortes {
	var property nombre
	var property calidad
	var property pesoDeCorte
	}


class Parrillada inherits Plato{
	const cortes=[]
	// el add recibe un objeto o una lista pero no un closure {}
	// method agregarCorte(unCorte)= cortes.add({unCorte})
	method agregarCorte(unCorte)= cortes.add(unCorte)
	override method esAptoParaVegetarianos()= false
	override method valoracion()= 15 * cortes.max({c=> c.calidad()}).calidad() - cortes.size()
	override method peso()= cortes.sum({c=> c.pesoDeCorte()})
	
}
