import cosas.*

object casaDePepeYJulian {

    const compras = []
    var cuenta = "definir cuenta"

    method definirCuenta(cuenta_) {
        cuenta = cuenta_
    }
    method lista() = compras

    method comprar(cosa){
        compras.add(cosa)
        cuenta.extraer(cosa.precio())
    }

    method cantidadDeCosasCompradas() = compras.size()

    method tieneAlgun(categoria) = (compras.filter {producto => producto.esCategoria(categoria)}).size() > 0 

    method vieneDeComprar(categoria) = (compras.last().esCategoria(categoria))

    method esDerrochona() = self.totalGastado() > 9000

    method compraMasCara() {
        var prodMasCaro = compras.first()
        compras.forEach {producto => prodMasCaro = self.elMasCaro(producto, prodMasCaro)}
        return prodMasCaro
    }

    method comprados(categoria) = compras.filter {producto => producto.esCategoria(categoria)}

    method malaEpoca() = compras.all{ producto => producto.esCategoria(comida)}

    method queFaltaComprar(lista){
        const listaCopy = lista.copy()
        compras.forEach{producto => listaCopy.contains(producto)
        listaCopy.remove(producto)}
        return listaCopy
    }

    method faltaComida() = (compras.filter {producto => producto.esCategoria(comida)}).size() < 2

    method categoriasCompradas(){
        const categorias = []
        compras.forEach{ producto => categorias.add(producto.categoria())}
        return categorias.withoutDuplicates()
    }

    //Extras
    method totalGastado(){
        var suma = 0
        compras.forEach {producto => suma = suma + producto.precio()}
        return suma
    }

    method elMasCaro(cosa1, cosa2){
        if (cosa1.precio() > cosa2.precio()){
            return cosa1
        } else{
            return cosa2
        }
    }
}

object cuentaCorriente {
    var saldo = 20

    method saldo() = saldo

    method depositar(dinero) {
        saldo = saldo + dinero
    }

    method extraer(valor) {
        if(saldo < valor) {
            self.error("No tiene saldo suficiente")
                } else {
            saldo = saldo - valor
        }
    }
}

object cuentaDeGastos {
    var saldo = 500
    const costoOperacion = 20

    method saldo() = saldo 

    method depositar(dinero) {
        if (dinero > 1000){
            self.error("No se puede depositar más de 1000")
        } else {
            saldo = saldo + dinero - costoOperacion
        }
    }

    method extraer(valor) {
        saldo = saldo - valor
    }
}

object miAsserter {

    //Esto devuelve true si el bloque lanzó una exception
    //Devuelve false si no lanzó una expcion
    method assertException(unBloque) {
      
      try {
        unBloque.apply()
        return false // Esto se ejecuta solamente si no hay un error
      }
      catch e: Exception {
        return true //Esto se va a ejecutar si hay un error 
      }

    }

}