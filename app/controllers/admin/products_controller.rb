class Admin::ProductsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_product, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Product.order('title asc')
  end

  def show
  end

  def new
    @current_item = Product.new
  end

  def edit
  end

  def create
    @current_item = Product.new(product_params)
    if @current_item.save
      redirect_to admin_products_path, notice: 'Successfully created product'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @current_item.update_attributes(product_params)
      redirect_to admin_products_path, notice: 'Successfully updated product'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_products_path
  end

  private

  def prepare_product
    @current_item = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :status, :weight, :unit, :category_id)
  end

end
