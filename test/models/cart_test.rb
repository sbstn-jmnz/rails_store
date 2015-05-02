require "test_helper"

class CartTest < MiniTest::Test	

	#Se define una prueba como un metodo de la clase CartTest
	def test_adds_one_item # prueba_agrega_un_item
		cart = Cart.new # se instancia un nuevo carrito
		cart.add_item 1 # al carro creado se le llama el metodo add_item y se le pasa un entero, que seria un id
		#finalmente se hace la prueba
		assert_equal cart.empty?, false #Esta el carro vacio?, la respuesta debiera ser falso si salio todo bien
		#hay que escribir el metodo empty
	end
	#La primera vez la prueba va a fallar, porque no se ha programado un metodo add_item a la clase 
	#Cart

	#esto es para agregar varias veces el mismo producto
	def test_adds_up_in_quanttity
		cart = Cart.new
		3.times { cart.add_item 1 }

		assert_equal cart.items.length, 1 #solo un item
		assert_equal cart.items.first.quantity, 3 #varias unidades del mismo item
	end

	#
	def test_retrieves_products
		product = Product.create! name: "Pepinillo", price: 1
		cart = Cart.new
		cart. add_item product.id

	assert_kind_of Product, cart.items.first.product
	end
end