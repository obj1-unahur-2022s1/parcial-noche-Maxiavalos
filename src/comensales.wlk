import comidas.*

class Comensales {
	const comidasQueComio= []
	var property peso	
	
	method comer(unaComida){comidasQueComio.add(unaComida)}
	method leAgrada(unaComida)
	//Era conveniente delegar 
	method estaSatisfecho(){
		return comidasQueComio.sum({c=> c.peso()}) >= self.peso() * 0.01
	}	
}



class Vegetarianos inherits Comensales{
	override method leAgrada(unaComida)= unaComida.esAptoParaVegetarianos() and unaComida.valoracion() > 85
	override method estaSatisfecho(){
		return super() and comidasQueComio.all({c=> not c.esAbundante()})
	}
	
}



class HambrePopular inherits Comensales{
	override method leAgrada(unaComida)= unaComida.esAbundante()
}

class PaladarFino inherits Comensales{
	override method leAgrada(unaComida)= unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	override method estaSatisfecho(){
		return super() and comidasQueComio.size().even()
	}
}




