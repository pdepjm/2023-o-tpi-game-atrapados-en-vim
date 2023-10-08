class Direccion{
	const property opuesta
	method puedeMoverseHacia(dir) = dir != opuesta
}

const derecha = new Direccion(opuesta = izquierda)
const izquierda = new Direccion(opuesta = derecha)
const arriba = new Direccion(opuesta = abajo)
const abajo = new Direccion(opuesta = arriba)
