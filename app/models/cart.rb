class Cart
	#esta no es una clase Active Record. Es una simple clase ruby
	#El la Clase Cart tendra items
	attr_reader :items

	def self.build_from_hash hash
	items = if hash["cart"] then
		hash["cart"]["items"].map do |item_data|
	CartItem.new item_data["product_id"], item_data["quantity"]	
		end
	else
		[]
	end
		new items
	end

	# El constructor de la clase creara para cada instancia una variable de instancia @items  
	def initialize items = []
		@items = items
	end
	
	#1- se escribe el metodo add_item para pasar la prueba
	#2- este metodo agregara producos al carro, pero si el producto ya 
	#existe, entonces no lo agrega
	def add_item product_id
		#primero se busca el item
		item = @items.find { |item| item.product_id == product_id }
		#si hay algo en el carro, se incremente
		if item
		item.increment
		#sino se crea un carro y se pasa el product_id
		else	
			@items << CartItem.new(product_id)
		end
	end

	# se escribe el metodo empty
	def empty?
		@items.empty?
	end

	def count
		@items.length
	end

	def show
	end

	def total_price
		@items.inject(0){|sum, item| sum + item.total_price}
	end

	def serialize
		items = @items.map do |item|
			{
				"product_id" => item.product_id,
				"quantity" => item.quantity
			}
		end

		{
			"items" => items
		}		
	end

end