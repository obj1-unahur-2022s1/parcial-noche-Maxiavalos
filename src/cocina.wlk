import comidas.*
import comensales.*

//Revisar comidasQueLeGustanA y Bonus incompleto
object Cocina{
	const todasLasParrilas= []
	
	method tieneBuenaOfertaVegetariana(){
		return (self.comidasParaVegetarianos() and self.comidasParaCarnivoros()).abs() <= 2
	}
	method comidasParaVegetarianos()= todasLasParrilas.filter({ c=> c.esAptoParaVegetarianos()})
	method comidasParaCarnivoros()= todasLasParrilas.filter({c=> not c.esAptoParaVegetarianos()})
	method platoFuerte()= self.comidasParaCarnivoros().max({ c => c.valoracion()})
	
	//method comidasQueLeGustanA(unComensal)= unComensal.filter({c => c.leAgrada(self)})
	method comidasQueLeGustanA(unComensal)= todasLasParrilas.filter({c => unComensal.leAgrada(self)})
	
	// BONUS
	// no esta bien implementado el bonus
	method elegirUnPlato(comensal){
		 if(comensal.all({p=> not p.leAgrada(p)}))
		 	{self.error("No le gusta ningun plato.")}
		 
		return comensal.anyOne({p => p.leAgrada(p)}) 	
	
}

}