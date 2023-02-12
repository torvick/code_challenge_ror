class GenerateOrder

  # Public Interface
  def self.build!(*args)
    new(*args).build
  end

  def initialize(args)
    @order_row = args
    client
    seller
    product
  end

  def build
    @order = Order.new(
      number_of_pieces: @order_row['Numero de piezas'],
      client_id: @client.id,
      seller_id: @seller.id,
      product_id: @product.id
    )
    if @order.save
      return {status: true, row: @order_row, order: @order}
    else
      return {status: false, row: @order_row, order: @order, errors: @order.errors}
    end
  end

  def client
    @client = Client.find_by(name: @order_row['Cliente'])
    if @client.nil?
      @client = Client.create(name: @order_row['Cliente'])
    end
  end

  def seller
    @seller = Seller.find_by(name: @order_row['Nombre del Vendedor'], address: @order_row['Diección del vendedor'])
    if @seller.nil?
      @seller = Seller.create(name: @order_row['Nombre del Vendedor'], address: @order_row['Diección del vendedor'])
    end
  end

  def product
    @product = Product.find_by(description: @order_row['Descripción del Producto'], price_per_piece: @order_row['Precio por pieza'])
    if @product.nil?
      @product = Product.create(description: @order_row['Descripción del Producto'], price_per_piece: @order_row['Precio por pieza'])
    end
  end

end
