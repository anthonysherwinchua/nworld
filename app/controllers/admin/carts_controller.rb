class Admin::CartsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_cart, only: [:show, :edit, :update]

  def index
    @current_items = Cart.order(status: :desc, created_at: :desc).map { |cart| CartCalculator.new(cart) }
  end

  def show
    @cart = @current_item
    DiscountCalculator.new(@current_item).recalculate!
  end

  def edit
  end

  def update
    if @current_item.update_attributes(cart_params)
      redirect_to admin_carts_path, notice: 'Successfully updated order'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def prepare_cart
    @current_item = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:status)
  end

end
