module OrdersHelper
  def get_total(pieces,product)
    product.price_per_piece.to_f * pieces.to_i
  end
end
