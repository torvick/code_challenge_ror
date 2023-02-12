class DashboardController < ApplicationController

  def index
    @clients  = Client.all
    @sellers  = Seller.all
    @products = Product.all
    @orders   = Order.all
    @batch_imports = BatchImport.all
  end

end
