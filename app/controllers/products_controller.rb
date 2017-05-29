class ProductsController < ApplicationController

  def index
    @nlighten_products = Product.published.where(category: Category.find_by(name: 'NLIGHTEN'))
    @nhance_products = Product.published.where(category: Category.find_by(name: 'NHANCE'))
  end

  def show
    @product = Product.published.find(params[:id])
  end
end
