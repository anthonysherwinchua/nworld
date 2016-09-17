class BillingsController < ApplicationController

  def index
    @form = Cart::BillingDetailsUpdateForm.new(cart)
  end

  def update
    @form = Cart::BillingDetailsUpdateForm.new(cart, cart_params)

    if @form.save
      redirect_to payments_path, flash: { notice: 'Successfully updated shopping cart' }
    else
      flash[:error] = @form.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def cart_params
    params.require(:form).permit(cart_attributes: [:first_name, :last_name, :address, :zip_code, :city,
                                                   :shippable_country])
  end

end
