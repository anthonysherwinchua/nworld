class LineItemsController < ApplicationController

  def create
    @cart_manager = prepare_cart_manager
    @cart_manager.add_product(params[:product_id])
    notice = 'Successfully added the product to cart'
    respond_to do |format|
      format.js { flash.now[:notice] = notice }
      format.html { redirect_to product_path(params[:product_id]), flash: { notice: notice } }
    end
  end

  def update
    @cart_manager = prepare_cart_manager

    if @cart_manager.update_line_item(line_item_params)
      redirect_to shopping_cart_path, flash: { notice: 'Successfully updated shopping cart' }
    else
      redirect_to shopping_cart_path, flash: { error: @cart_manager.errors.to_sentence }
    end
  end

  def destroy
    @cart_manager = prepare_cart_manager

    if @cart_manager.delete_line_item(params[:id])
      redirect_to shopping_cart_path, flash: { notice: 'Successfully removed a product from your shopping cart' }
    else
      redirect_to shopping_cart_path, flash: { error: @cart_manager.errors.to_sentence }
    end
  end

  private

  def prepare_cart_manager
    CartManager.new(cart.id)
  end

  def line_item_params
    params.require(:line_item).permit(:id, :quantity)
  end

end
