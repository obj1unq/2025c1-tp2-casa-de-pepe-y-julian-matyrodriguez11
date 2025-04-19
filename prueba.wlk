object casaDePepeYJulian {
    val compras = list()

    method comprar(producto: Any) {
        compras.add(producto)
    }

    method cantidad() {
        println(compras.size)
    }
}
